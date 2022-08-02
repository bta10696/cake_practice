<?php

namespace App\Model\Table;

use Cake\Validation\Validator;
use App\Model\Table\AppTable;


class NewsTable extends AppTable
{

    public $attaches = [
        'images' => [
            'extensions' => [],
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
        $this->setTable("news");
        $this->slug = "News";
        
    }

    public function validationDefault(Validator $validator)
    {
        $validator->notBlank("title", "※ タイトルをご入力ください。")->notEmptyString("title", "※ タイトルをご入力ください。")->minLength("title", 5, "※ 5字以上でご入力ください。")->maxLength("title", 100, "※ 100字以下でご入力ください。");
        return $validator;
    }
}
