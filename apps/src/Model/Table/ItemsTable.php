<?php

namespace App\Model\Table;

use Cake\Validation\Validator;
use App\Model\Table\AppTable;


class ItemsTable extends AppTable
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
        $this->setTable("items");
        $this->slug = "Items";
        $options["contain"] = $this->_associations_attached();

        // $this->hasOne('attached')
        //     ->setForeignKey('id')
        //     ->setBindingKey('table_id')
        //     ->setConditions([]);

        $this->hasOne('Category')
            ->setForeignKey('id')
            ->setBindingKey('category_id')
            ->setConditions(['Category.status' => 'publish']);
    }

    public function validationDefault(Validator $validator)
    {
        $validator->notBlank("publish_at", "※ 掲載日をご選択ください。")->notEmptyDateTime("publish_at", "※ 掲載日をご選択ください。")->notBlank("item_name", "※ 商品名をご入力ください。")
            ->notEmptyString("item_name", "※ 商品名をご入力ください。")->minLength("item_name", 2, "※ 2字以上でご入力ください。")->maxLength("item_name", 100, "※ 100字以下でご入力ください。")
            ->notBlank("price", "※ 定格をご入力ください。")->notEmptyString("price", "※ 定格をご入力ください。")
            ->minLength("price", 2, "※ 2字以上でご入力ください。")->maxLength("price", 20, "※ 20字以下でご入力ください。")
            ->minLength("old_price", 2, "※ 2字以上でご入力ください。")->maxLength("old_price", 20, "※ 20字以下でご入力ください。")->allowEmpty("old_price")
            ->notEmptyString("category_id", "※ ご選択ください。")->notEmptyString("description", "※ ご入力ください。")
            ->notEmptyArray("__images", "※ 画像をご選択ください。")->add("__images", ["custom" => ["rule" => function ($value, $context) {
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
