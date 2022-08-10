<?php

namespace App\Controller;

use Cake\Event\Event;
use App\Controller\AppController;
// use App\Controller\Admin\AppController;
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
        $this->viewBuilder()->layout('default');
        $cond = [
            'Items.status' => 'publish',
            'Items.publish_at <=' => (new \DateTime('now', new \DateTimeZone('Asia/Tokyo')))->format('Y-m-d')
        ];
        $options = [];
        $options["contain"] = $this->_associations_attached();
        $options["contain"][] = 'Category';
        $options['limit'] = 3;
        parent::_lists($cond, $options);
    }


    public function detail($id = null)
    {
        $this->viewBuilder()->layout('default');
        $cond = [];
        $options = [];
        parent::_detail($id, $cond, $options);
    }
}
