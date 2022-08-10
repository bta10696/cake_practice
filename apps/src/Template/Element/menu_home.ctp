<div class="box">
    <h3 style="margin-bottom:20px;" class="box_h3"><?= $h3 ?></h3>
    <?php $to_edit_screen = ['product', 'producten', 'social', 'socialen', 'company', 'companiesen']; ?>
    <div class="row row-cols-4">
        <?php foreach ($config_ as $menu) : ?>
            <div class="btn_area" style="text-align:left;margin-left: 20px;margin-bottom: 10px !important;">
                <div class="col">
                    <?php
                    $url = ['prefix' => 'admin', 'controller' => strtolower($menu->slug), 'action' => 'index'];
                    if (in_array(strtolower($menu->slug), $to_edit_screen, true))
                        $url = ['prefix' => 'admin', 'controller' => strtolower($menu->slug), 'action' => 'edit', 1];
                    ?>
                    <?= $this->Html->link(
                        $menu->title,
                        $url,
                        ['class' => 'btn_send btn_search', 'style' => 'width:130px;text-align:center;']
                    ); ?>
                </div>
            </div>
        <?php endforeach; ?>
    </div>
</div>