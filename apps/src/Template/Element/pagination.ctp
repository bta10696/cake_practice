<?php if ($this->Paginator->hasPrev() || $this->Paginator->hasNext()) : ?>
    <div class="col-12">
        <nav>
            <ul class="pagination justify-content-center">


                <?php if ($this->Paginator->hasPrev()) : ?><?= $this->Paginator->prev('<') ?><?php endif; ?>

                <?= $this->Paginator->numbers(); ?>

                <?php if ($this->Paginator->hasNext()) : ?><?= $this->Paginator->next('>') ?><?php endif; ?>


            </ul>
        </nav>
    </div>
<?php endif; ?>

