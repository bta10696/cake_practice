<?php $this->start('beforeHeaderClose'); ?>
<script src="/admin/common/js/ckeditor.js"></script>
<script src="/admin/common/js/ja.js"></script>
<?php $this->end(); ?>

<?php $this->start('css'); ?>
<?= $this->Html->css(["/admin/assets/css/edit"]); ?>
<?php $this->end(); ?>

<div class="title_area">
    <h1>ITEMS管理</h1>
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
                        <td>表示板号</td>
                        <td><?= $entity->isNew() ? '新規登録' : sprintf('No. %04d', $entity['id']) ?></td>
                    </tr>
                    <tr>
                        <td>掲載日<span class="attent">※必須</span></td>
                        <td>
                            <div>
                                <input type="date" name="publish_at" value="<?= is_string($entity->publish_at) ? $entity->publish_at : (is_null($entity->publish_at) ? '' : $entity->publish_at->format('Y-m-d')) ?>">

                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>カテゴリー <span class="attent">※必須</span></td>
                        <td>
                            <div>
                                <?= $this->Form->control("category_id", ['type' => 'select', 'options' => $cat_list, 'label' => false, 'empty' => '選択してください']) ?>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>商品名<span class="attent">※必須</span></td>
                        <td>
                            <div>
                                <?= $this->Form->control("item_name", ['label' => false, "minlength" => 2, "maxlength" => 100,]) ?>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>内容<span class="attent">※必須</span></td>
                        <td>
                            <div>
                                <?= $this->Form->control("description", ['label' => false, "minlength" => 2, "maxlength" => 1000, 'rows' => 6]) ?>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>説明文<span class="attent">※必須</span></td>
                        <td>
                            <div id="toolbar-container"></div>
                            <div id="editor" style="border: 1px solid #ccc !important;"><?= @$data['content'] ?></div>
                            <?= $this->Form->textarea("content", ['hidden' => 'hidden', 'id' => 'event-content', 'error' => false, 'label' => false, "minlength" => 1, "maxlength" => 1000]) ?>
                            <?php if ($this->Form->isFieldError('content')) : ?>
                                <div class="error-message">
                                    <div class="error-message"><?= @$this->Form->error('content') ?></div>
                                </div>
                            <?php endif ?>
                        </td>
                    </tr>
                    <tr>
                        <td>定格<span class="attent">※必須</span></td>
                        <td>
                            <div>
                                <?= $this->Form->control("price", ['label' => false, "minlength" => 2, "maxlength" => 20,]) ?>

                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>状況</td>
                        <td>
                            <input type="hidden" name="desired" value="normal">
                            <div class="radio checkbox-inline">
                                <input type="radio" name="status_2" value="normal" id="radio-4" <?= @$data['status_2'] == 'normal' ? 'checked="checked"' : ''; ?>><label class="mar_r20" for="radio-4">Normal</label>
                            </div>
                            <div class="radio checkbox-inline">
                                <input type="radio" name="status_2" value="sale" id="radio-5" <?= @$data['status_2'] == 'sale' ? 'checked="checked"' : ''; ?>><label class="mar_r20" for="radio-5">Sale</label>
                            </div>
                            <div class="radio checkbox-inline">
                                <input type="radio" name="status_2" value="new" id="radio-6" <?= @$data['status_2'] == 'new' ? 'checked="checked"' : ''; ?>><label class="mar_r20" for="radio-6">New</label>
                            </div>
                            <div class="radio checkbox-inline">
                                <input type="radio" name="status_2" value="hot" id="radio-7" <?= @$data['status_2'] == 'hot' ? 'checked="checked"' : ''; ?>><label class="mar_r20" for="radio-7">Hot</label>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>元定格</td>
                        <td>
                            <div>
                                <?= $this->Form->control("old_price", ['label' => false, "minlength" => 2, "maxlength" => 20]) ?>

                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>画像<span class="attent">※必須</span></td>
                        <td class="edit_image_area">
                            <?= $this->element('form/image', ["accept" => ".jpg,.jpeg,.gif,.png,.pjpeg"]) ?>

                        </td>
                    </tr>
                    <tr>
                        <td>記事表示</td>
                        <td>
                            <div>
                                <?= $this->Form->control("status", ['type' => 'select', 'options' => $status, 'label' => false]) ?>

                            </div>
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