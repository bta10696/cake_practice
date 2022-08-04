<?php
$slug = strtolower($ModelName);
$count = isset($total_count) ? $total_count : 0;
$has_status = $datas->getRepository()->getSchema()->hasColumn('status');
$has_position = $datas->getRepository()->getSchema()->hasColumn('position');
$datas = $$slug->toArray();
?>
<style>
    th,
    td {
        text-align: center;
    }
</style>
<div class="title_area">
    <h1>ITEMS管理</h1>
    <div class="pankuzu">
        <ul>
            <?= $this->element('pankuzu_home'); ?>
            <li><span>ITEMS管理</span></li>
        </ul>
    </div>
</div>

<div class="content_inr">
    <div class="box">
        <h3 class="box__caption--count">
            <span>登録一覧</span>
            <span class="count"><?= $count ?>件の登録</span>
        </h3>
        <div class="btn_area" style="margin-top:10px;">
            <?= $this->Html->link('新規登録', ['action' => 'edit'], ['class' => 'btn_confirm btn_post']); ?>
        </div>
        <div class="table_area">
            <table class="table__list" style="table-layout: fixed;">
                <colgroup>
                    <?= $has_status ? '<col style="width: 135px;">' : "" ?>
                    <col style="width: 180px;">
                    <col>
                    <col style="width: 250px;">
                    <col style="width: 135px;">
                    <col style="width: 80px;">
                    <?= $has_position ? '<col style="width: 150px;">' : "" ?>
                </colgroup>
                <tr>
                    <?= $has_status ? '<th>ステイタス</th>' : "" ?>
                    <th>掲載日時</th>
                    <th>商品名</th>
                    <th>カテゴリー</th>
                    <th>定格</th>
                    <th>確認</th>
                    <?= $has_position ? '<th>順序の変更</th>' : "" ?>
                </tr>
                <?php foreach ($datas as $key => $data) : ?>
                    <?php
                        $tr_class = 'visible';
                        if ($has_status) :
                            $is_publish = $data->status == PUBLISH;
                            $tr_class = $is_publish ? $tr_class : 'unvisible';
                            $status_btn_class = $is_publish ? 'visi' : 'unvisi';
                        endif;
                        ?>
                    <tr class="<?= $tr_class ?>" id="content-<?= $data->id ?>">

                        <?php if ($has_status) : ?>
                            <td>
                                <div class="<?= $status_btn_class ?>">
                                    <?= $this->Html->link($status[$data->status], ['action' => 'enable', $data->id], ['class' => 'scroll_pos']); ?>
                                </div>
                            </td>
                        <?php endif; ?>

                        <td><?= is_null($data->publish_at) ? '' : $data->publish_at->format('Y/m/d  h:i'); ?></td>
                        <td><?= $this->Html->link(html_decode($data->item_name), ['action' => 'edit', $data->id]); ?></td>
                        <td><?= @html_decode($data->category->category_name) ?></td>
                        <td><?= $this->Html->link(html_decode($data->price), ['action' => 'edit', $data->id]); ?></td>


                        <td>
                            <div class="prev">
                                <a href="/<?= $slug ?>/detail/<?= $data->id ?>?preview=on" target="_blank">プレビュー</a>
                            </div>
                        </td>

                        <?php if ($has_position) : ?>
                            <td>
                                <ul class="ctrlis">
                                    <?php if ($key == 0) : ?>
                                        <li class="non">&nbsp;</li>
                                        <li class="non">&nbsp;</li>
                                    <?php else : ?>
                                        <li class="cttop">
                                            <?= $this->Html->link('top', ['action' => 'position', $data->id, 'top'], ['class' => 'scroll_pos']) ?>
                                        </li>
                                        <li class="ctup">
                                            <?= $this->Html->link('top', ['action' => 'position', $data->id, 'up'], ['class' => 'scroll_pos']) ?>
                                        </li>
                                    <?php endif; ?>

                                    <?php if ($key == $count - 1) : ?>
                                        <li class="non">&nbsp;</li>
                                        <li class="non">&nbsp;</li>
                                    <?php else : ?>
                                        <li class="ctdown">
                                            <?= $this->Html->link('top', ['action' => 'position', $data->id, 'down'], ['class' => 'scroll_pos']) ?>
                                        </li>
                                        <li class="ctend">
                                            <?= $this->Html->link('bottom', ['action' => 'position', $data->id, 'bottom'], ['class' => 'scroll_pos']) ?>
                                        </li>
                                    <?php endif; ?>
                                </ul>
                            </td>
                        <?php endif; ?>

                    </tr>
                <?php endforeach; ?>
            </table>
        </div>
        <?= $this->element('pagination') ?>
        <div class="btn_area" style="margin-top:10px;">
            <?= $this->Html->link('新規登録', ['action' => 'edit'], ['class' => 'btn_confirm btn_post']); ?>
        </div>
    </div>
</div>