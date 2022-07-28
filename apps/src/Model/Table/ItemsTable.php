<?php

namespace App\Model\Table;

use Cake\Validation\Validator;
use App\Model\Table\AppTable;


class ItemsTable extends AppTable
{

    public $attaches = [
        'images' => [
            'extensions' => ['jpg','jpeg','gif','png','svg','ico','pjpeg'],
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
        $this->setTable("items");
        $this->slug = "Items";
        $options["contain"] = $this->_associations_attached();
    }

    public function validationDefault(Validator $validator)
    {
        $validator->notBlank("start_date", "※ 掲載日をご選択ください。")->notEmptyDate("start_date", "※ 掲載日をご選択てください。")->notBlank("category", "※ カテゴリーをご入力ください。")->notEmptyString("category", "※ カテゴリーをご入力てください。")->notBlank("title", "※ タイトルをご入力ください。")->notEmptyString("title", "※ タイトルをご入力てください。")->minLength("title", 10, "※ 10字以上でご入力ください。")->maxLength("title", 200, "※ 200字以上でご入力ください。")->notBlank("sale", "※ セールをご入力ください。")->notEmptyString("sale", "※ セールをご入力てください。")->notEmptyArray("__images", "※ 画像をご選択てください。")->add("__images", [ "custom" => [ "rule" => function ($value, $context) { foreach ($value as $original => $image_info) { $ext_exp = explode(".", $original); $ext = end($ext_exp); if (!in_array(".".$ext, ['.jpg','.jpeg','.gif','.png','.svg','.ico','.pjpeg'])) { return "※ .jpg,.jpeg,.gif,.png,.svg,.ico,.pjpegファイルのみでご選択ください。";} } return true; }, ], ], );
        return $validator;
    }
}
