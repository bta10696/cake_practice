<?php

namespace App\Model\Table;

use Cake\Validation\Validator;
use App\Model\Table\AppTable;


class AaTable extends AppTable
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
        $this->setTable("aa");
        $this->slug = "Aa";
        $options["contain"] = $this->_associations_attached();
    }

    public function validationDefault(Validator $validator)
    {
        
        return $validator;
    }
}
