<?php
namespace App\Controller;
use Cake\Event\Event;

/**
 * Static content controller
 *
 * This controller will render views from Template/Pages/
 *
 * @link https://book.cakephp.org/3.0/en/controllers/pages-controller.html
 */
class HomesController extends AppController
{

    // public function beforeFilter(\Cake\Event\Event $event)
    // {
    //     $this->modelName = 'Infos';
    //     $this->{$this->modelName} = $this->getTableLocator()->get($this->modelName);
    //     parent::beforeFilter($event);
    // }

    public function index()
    {
$this->viewBuilder()->layout('default');
    }
}
