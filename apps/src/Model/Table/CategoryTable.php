<?php

namespace App\Model\Table;

use Cake\Validation\Validator;
use App\Model\Table\AppTable;


class CategoryTable extends AppTable
{

    public $attaches = [
        'images' => [
            'extensions' => ['jpg', 'jpeg', 'gif', 'png', 'pjpeg'],
            'width' => 430,
            'height' => 290,
            'thumbnails' => [
                's' => [
                    'width' => 123,
                    'height' => 123
                ]
            ],
        ],
        'files' => [
            'extensions' => []
        ]
    ];


    public function initialize(array $config)
    {
        parent::initialize($config);
        $this->setTable("category");
        $this->slug = "Category";
        $options["contain"] = $this->_associations_attached();
    }

    public function validationDefault(Validator $validator)
    {
        $validator->notBlank("category_name", "※ カテゴリー名をご入力ください。")->notEmptyString("category", "※ カテゴリー名をご入力ください。")->minLength("category", 2, "※ 2字以上でご入力ください。")->maxLength("category", 100, "※ 100字以下でご入力ください。")->notEmptyArray("__images", "※ 画像をご選択ください。")->add("__images", ["custom" => ["rule" => function ($value, $context) {
            foreach ($value as $original => $image_info) {
                $ext_exp = explode(".", $original);
                $ext = end($ext_exp);
                if (!in_array("." . $ext, ['.jpg', '.jpeg', '.gif', '.png', '.pjpeg'])) {
                    return "※ .jpg,.jpeg,.gif,.png,.pjpegファイルのみでご選択ください。";
                }
            }
            return true;
        },],],);
        return $validator;
    }
}
