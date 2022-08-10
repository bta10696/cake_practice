<?php

/**
 * ページネーションのレイアウトを変更したい場合はここを編集
 */
return [

    'prevActive' => '  <li class="page-item "><a class="page-link" rel="prev" href="{{url}}">{{text}}</a></li>',
    'prevDisabled' => ' <li class="page-item active"><a class="page-link"  href="" onclick="return false;">{{text}}</a></li>',
    'number' => '<li class="page-item"><a class="page-link" href="{{url}}">{{text}}</a></li>',
    'current' => '<li class="page-item active"><a class="page-link" href="{{url}}">{{text}}</a></li>',
    'nextActive' => '<li class="page-item "><a class="page-link" rel="next" href="{{url}}">{{text}}</a></li>',
];

