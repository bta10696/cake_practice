<?php $this->start('css'); ?>
<?= $this->Html->css(["/admin/assets/css/edit"]); ?>
<?php $this->end(); ?>

<div class="title_area">
    <h1><?= $h1 ?></h1>
    <div class="pankuzu">
        <ul>
            <?= $this->element('pankuzu_home'); ?>
            <li><?= $h1 ?>・更新</li>
        </ul>
    </div>
</div>

<div class="content_inr">
    <div class="box config">
        <h3 class="box_h3">更新・確認
            <div class="prev">
                <a href="<?= $prev_url ?>" target="_blank">プレビュー</a>
            </div>
        </h3>
        <div class="table_area form_area">
            <?= $this->Flash->render('success') ?>
            <?= $this->Form->create($entity, ['type' => 'file', 'id' => 'frm-form']); ?>
            <div class="table_area form_area">
                <table class="vertical_table table__meta">
                    <tr>
                        <td>タイトル <span class="attent">※必須</span></td>
                        <td>
                            <div>
                                <?= $this->Form->control("title", ['label' => false, "minlength" => 1, "maxlength" => 100, 'readonly' => 'readonly']) ?>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>内容 <span class="attent">※必須</span></td>
                        <td>
                            <?= $this->Form->textarea("content", ['id' => '_content', 'label' => false, "minlength" => 1, "maxlength" => 20000, 'rows' => 28]) ?>
                        </td>
                    </tr>
                </table>
            </div>
            <?= $this->Form->end(); ?>
            <div class="btn_area btn_area--center">
                <a href="#" class="btn_confirm submitButton">変更する</a>
            </div>
        </div>
    </div>
</div>

<?php $this->start('beforeBodyClose'); ?>
<script src="/admin/assets/js/common.js"></script>
<?php $this->end(); ?>