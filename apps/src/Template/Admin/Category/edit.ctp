<?php $this->start('beforeHeaderClose'); ?>
<script src="/admin/common/js/ckeditor.js"></script>
<script src="/admin/common/js/ja.js"></script>
<?php $this->end(); ?>

<?php $this->start('css'); ?>
<?= $this->Html->css(["/admin/assets/css/edit"]); ?>
<?php $this->end(); ?>

<div class="title_area">
    <h1>カテゴリー管理</h1>
    <div class="pankuzu">
        <ul>
            <?= $this->element('pankuzu_home'); ?>
            <li><?= $this->Html->link('一覧画面', ['action' => 'index']); ?></li>
            <li><?= $entity->isNew() ? '新規登録' : '更新' ?></li>
        </ul>
    </div>
</div>

<div class="content_inr">
    <div class="box config">
        <h3><?= $entity->isNew() ? '新規登録' : '更新' ?></h3>
        <div class="table_area form_area">
            <?php $this->Form->setTemplates(['dateWidget' => '<input type="date" name="{{name}}" value="{{value}}"{{attrs}}>']) ?>
            <?= $this->Form->create($entity, ['type' => 'file', 'id' => 'frm-form']); ?>
            <div class="table_area form_area">
                <table class="vertical_table table__meta">
                    <tr>
                        <td>表示番号</td>
                        <td><?= $entity->isNew() ? '新規登録' : sprintf('No. %04d', $entity['id']) ?></td>
                    </tr>
                    <tr>
                        <td>記事表示</td>
                        <td>
                            <div>
                                <?= $this->Form->control("status", ['type' => 'select', 'options' => $status, 'label' => false]) ?>

                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>カテゴリー名</td>
                        <td>
                            <div>
                                <?= $this->Form->control("category_name", ['label' => false, "minlength" => 2, "maxlength" => 100,]) ?>

                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>画像</td>
                        <td class="edit_image_area">
                            <?= $this->element('form/image', ["accept" => ".jpg,.jpeg,.gif,.png,.pjpeg"]) ?>

                        </td>
                    </tr>
                </table>
            </div>
            <?= $this->Form->end(); ?>
            <div class="btn_area btn_area--center">
                <a href="#" class="btn_confirm submitButton"><?= $entity->isNew() ? '登録する' : '変更する' ?></a>
                <?php if (!$entity->isNew()) : ?>
                    <a href="javascript:kakunin('データを完全に削除します。よろしいですか？','<?= $this->Url->build(['action' => 'delete', $entity['id'], 'content']) ?>')" class="btn_delete">削除する</a>
                <?php endif; ?>
            </div>
        </div>
    </div>
</div>

<?php $this->start('beforeBodyClose'); ?>
<script src="/admin/assets/js/common.js"></script>
<?php $this->end(); ?>