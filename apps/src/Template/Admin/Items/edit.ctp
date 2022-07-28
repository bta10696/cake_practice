<?php $this->start('beforeHeaderClose'); ?>
<script src="/admin/common/js/ckeditor.js"></script>
<script src="/admin/common/js/ja.js"></script>
<?php $this->end(); ?>

<?php $this->start('css'); ?>
<?= $this->Html->css(["/admin/assets/css/edit"]); ?>
<?php $this->end(); ?>

<div class="title_area">
	<h1>商品管理</h1>
	<div class="pankuzu">
		<ul>
			<?= $this->element('pankuzu_home'); ?>
			<li><?= $this->Html->link('一覧画面',['action'=>'index']); ?></li>
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
    <td>状態</td>
    <td>新規 </td>
</tr><tr>
    <td>掲載日</td>
    <td>
        <div>
            <?= $this->Form->control("start_date", ['type'=>'date', 'label' => false])?>
            
        </div>						
    </td>
</tr><tr>
    <td>カテゴリー</td>
    <td>
        <div>
            <select name="category">
                <option value>選択してください</option>
                <option value="1">Option 1</option>
                <option value="2">Option 2</option>
                <option value="3">Option 3</option>
            </select>
            
        </div>						
    </td>
</tr><tr>
    <td>タイトル</td>
    <td>
        <div>
            <?= $this->Form->control("title", ['label' => false, "minlength"=>10, "maxlength"=>200,])?>
            
        </div>						
    </td>
</tr><tr>
    <td>セール</td>
    <td>
        <div class="checkbox">
            <input type="checkbox" name="sale" value="0" id="checkbox-0"><label class="mar_r20" for="checkbox-0">Checkbox 1</label>
        </div>
        <div class="checkbox">
            <input type="checkbox" name="sale" value="1" id="checkbox-1"><label class="mar_r20" for="checkbox-1">Checkbox 2</label>
        </div>	
        <div class="checkbox">
            <input type="checkbox" name="sale" value="2" id="checkbox-2"><label class="mar_r20" for="checkbox-2">Checkbox 3</label>
        </div>	
        				
    </td>
</tr><tr>
    <td>画像</td>
    <td class="edit_image_area">
        <?= $this->element('form/image', ["accept"=> ".jpg,.jpeg,.gif,.png,.svg,.ico,.pjpeg"]) ?>
        
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