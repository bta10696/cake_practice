<?php

namespace App\Controller;

use Cake\Event\Event;
use App\Controller\AppController;
use Cake\Utility\Inflector;


class ItemsController extends AppController
{

    public function beforeFilter(Event $event)
    {
        parent::beforeFilter($event);
        $this->modelName = Inflector::camelize($this->name);
        
        $this->set('ModelName', $this->modelName);
    }


    public function index()
    {
        $cond = [];
        $options = [];
        parent::_lists($cond, $options);
    }


    public function detail($id = null)
    {
        $cond = [];
        $options = [];
        parent::_detail($id, $cond, $options);
    }


    
}
?>