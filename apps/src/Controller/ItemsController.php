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
        $cond = [
            $this->modelName . '.status' => PUBLISH,
            'Category.status' => PUBLISH,
            'OR' => [
                $this->modelName . '.publish_at <=' => (new \DateTime('now', new \DateTimeZone('Asia/Tokyo')))->format('Y-m-d'),
                $this->modelName . '.publish_at IS NULL'
            ]
        ];
        $cond = $this->request->getQuery('preview') === 'on' ? [] : $cond;

        $options = [];
        $options["contain"] = $this->_associations_attached();
        $options['contain'][] = 'Category';

        if (is_null(parent::_detail($id, $cond, $options))) $this->redirect(['action' => 'index']);
    }

    protected function _associations_attached()
    {
        $slug = $this->modelName;
        return [
            'AttachedFiles' => function ($q) use ($slug) {
                return $q->where(['slug' => $slug]);
            },
            'AttachedImages' => function ($q) use ($slug) {
                return $q->where(['slug' => $slug]);
            }
        ];
    }
}
