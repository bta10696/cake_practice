-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- ホスト: localhost:8889
-- 生成日時: 2022 年 8 月 03 日 09:54
-- サーバのバージョン： 5.7.34
-- PHP のバージョン: 7.4.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

--
-- データベース: `cake_practice`
--

-- --------------------------------------------------------

--
-- テーブルの構造 `attached`
--

CREATE TABLE `attached` (
  `id` int(11) NOT NULL,
  `table_id` int(11) NOT NULL COMMENT 'Slugに合わせてテーブルのID',
  `slug` varchar(20) NOT NULL,
  `file_name` varchar(255) NOT NULL COMMENT 'ファイル名',
  `original_file_name` varchar(255) NOT NULL COMMENT '元ファイル名',
  `size` int(11) DEFAULT NULL,
  `extension` varchar(4) NOT NULL COMMENT 'ファイル拡大',
  `type` enum('images','files') NOT NULL DEFAULT 'images',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- テーブルのデータのダンプ `attached`
--

INSERT INTO `attached` (`id`, `table_id`, `slug`, `file_name`, `original_file_name`, `size`, `extension`, `type`, `created`, `modified`) VALUES
(2, 1, 'Category', 'fd31170a43410299321d58dc1f84b355_16594977710835.jpeg', '0627c51361eba4cdf93222a4ad6fc46e.jpeg', 78431, 'jpeg', 'images', '2022-08-03 03:36:14', NULL),
(3, 2, 'Category', '6d04757cb8698cba14d9164aa3efde68_16594986980484.jpeg', 'hinh-anh-dep-ve-hoa-sen.jpeg', 66872, 'jpeg', 'images', '2022-08-03 03:51:40', NULL),
(4, 2, 'Items', 'a1fec9c81bf98cceedf35e7c8e0c402d_16594344745332.jpeg', '2008150935-Mo-let-la-gii.jpeg', 89134, 'jpeg', 'images', '2022-08-03 07:33:23', NULL),
(5, 3, 'Items', 'd33ac8119cee53b518bb919d0da79f96_16595134233785.jpeg', 'kern_it_85103537_1920x1080px.jpeg', 671799, 'jpeg', 'images', '2022-08-03 07:57:07', NULL),
(6, 4, 'Items', '6071ab517ed168c6a0d07f34d9ab501c_16595203809241.jpeg', '2008150935-Mo-let-la-gii.jpeg', 89134, 'jpeg', 'images', '2022-08-03 09:53:04', NULL);

-- --------------------------------------------------------

--
-- テーブルの構造 `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `status` enum('draft','publish') NOT NULL DEFAULT 'draft',
  `category_name` varchar(100) NOT NULL,
  `type` varchar(20) DEFAULT NULL,
  `position` int(11) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- テーブルのデータのダンプ `category`
--

INSERT INTO `category` (`id`, `created`, `modified`, `status`, `category_name`, `type`, `position`) VALUES
(1, '2022-08-03 03:36:14', '2022-08-03 03:58:47', 'publish', 'test category', NULL, 2),
(2, '2022-08-03 03:51:40', '2022-08-03 03:58:46', 'publish', 'test 2', NULL, 1);

-- --------------------------------------------------------

--
-- テーブルの構造 `configs`
--

CREATE TABLE `configs` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `slug` varchar(20) NOT NULL,
  `is_default` int(1) NOT NULL DEFAULT '0' COMMENT '１デフォルトテーブル',
  `lang` enum('jp','en') NOT NULL DEFAULT 'jp',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- テーブルのデータのダンプ `configs`
--

INSERT INTO `configs` (`id`, `title`, `slug`, `is_default`, `lang`, `created`, `modified`) VALUES
(2, '設定', 'configs', 1, 'jp', '2022-07-14 10:58:40', NULL),
(3, 'ユーザー', 'users', 1, 'jp', '2022-07-14 10:58:40', NULL),
(4, '添付', 'attached', 1, 'jp', '2022-07-14 10:59:39', NULL),
(5, '商品', 'items', 0, 'jp', '2022-08-02 09:03:58', '2022-08-02 18:32:10'),
(6, 'カテゴリー', 'category', 0, 'jp', '2022-08-03 00:05:53', NULL);

-- --------------------------------------------------------

--
-- テーブルの構造 `items`
--

CREATE TABLE `items` (
  `id` int(11) NOT NULL,
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `position` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `status` enum('draft','publish') NOT NULL DEFAULT 'draft',
  `item_name` varchar(100) NOT NULL,
  `price` varchar(20) NOT NULL,
  `status2` enum('new','hot','trending','normal') NOT NULL DEFAULT 'normal',
  `old_price` int(20) DEFAULT NULL,
  `publish_at` datetime DEFAULT NULL COMMENT '掲載日時',
  `category_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- テーブルのデータのダンプ `items`
--

INSERT INTO `items` (`id`, `created`, `modified`, `position`, `status`, `item_name`, `price`, `status2`, `old_price`, `publish_at`, `category_id`) VALUES
(2, '2022-08-02 10:04:44', '2022-08-03 09:53:04', 3, 'publish', 'test item', '110', 'new', 220, '2022-08-02 19:00:00', 1),
(3, '2022-08-03 07:57:07', '2022-08-03 09:53:04', 2, 'draft', 'test item 22', '550', 'new', 999, '2022-08-06 16:56:00', 2),
(4, '2022-08-03 09:53:04', '2022-08-03 09:53:04', 1, 'draft', 'test item11', '110', 'normal', 444, '2022-08-06 18:52:00', 2);

-- --------------------------------------------------------

--
-- テーブルの構造 `news`
--

CREATE TABLE `news` (
  `id` int(11) NOT NULL,
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `position` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `status` enum('draft','publish') NOT NULL DEFAULT 'draft',
  `title` varchar(100) NOT NULL DEFAULT '',
  `content` text NOT NULL,
  `publish_at` datetime DEFAULT NULL COMMENT '掲載日時',
  `category_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- テーブルの構造 `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '作成日',
  `modified` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日',
  `username` varchar(30) NOT NULL COMMENT 'ログインアカウント',
  `password` varchar(200) NOT NULL COMMENT 'パスワード',
  `name` varchar(60) NOT NULL COMMENT '氏名',
  `email` varchar(60) NOT NULL COMMENT 'メールアドレス',
  `status` enum('draft','publish') NOT NULL DEFAULT 'publish' COMMENT 'ステイタス',
  `role` int(11) NOT NULL DEFAULT '0' COMMENT '権限'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- テーブルのデータのダンプ `users`
--

INSERT INTO `users` (`id`, `created`, `modified`, `username`, `password`, `name`, `email`, `status`, `role`) VALUES
(1, '2022-07-04 17:49:36', '2022-07-28 09:27:23', 'admin', '$2y$10$WyHYQwl4Ax5cdCQhU6MiA.8Du5q5bPh23XahHpvQDgHnGbnEV.VKW', 'Admin', 'develop+cms6_admin@caters.co.jp', 'publish', 0),
(2, '2022-07-28 09:22:41', '2022-08-02 06:55:38', 'yenyen', '$2y$10$X9HPCJq.rNJLR3pOV9f7.ONTERjgBoHcDzNhzMw486mT0DMQnr9tm', 'yenyen', 'miz-admin@mizuha-nippon.jp', 'publish', 10),
(3, '2022-08-01 05:04:41', NULL, 'mizuha_staff', '$2y$10$FRXEt5J38.SDzSrQeM95ReBGHM0ZTrb/PPEZuNj5i3z0Rn7tp.Vpq', 'MIZ', 'caters@caters.co.jp', 'publish', 10);

-- --------------------------------------------------------

--
-- テーブルの構造 `videos`
--

CREATE TABLE `videos` (
  `id` int(11) NOT NULL,
  `code` varchar(100) NOT NULL,
  `title` varchar(100) NOT NULL,
  `status` enum('publish','draft') NOT NULL DEFAULT 'draft',
  `position` int(11) NOT NULL DEFAULT '0',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- テーブルのデータのダンプ `videos`
--

INSERT INTO `videos` (`id`, `code`, `title`, `status`, `position`, `created`, `modified`) VALUES
(1, 'https://www.youtube.com/watch?v=CIWD9fYmDig', '取り扱い説明ビデオ　インジケーター篇', 'publish', 2, '2022-07-29 07:45:38', '2022-08-01 02:23:55'),
(2, 'https://www.youtube.com/watch?v=v-FNXUcz6R4', 'TOCHIGI', 'publish', 1, '2022-08-01 02:23:55', '2022-08-01 02:23:55');

--
-- ダンプしたテーブルのインデックス
--

--
-- テーブルのインデックス `attached`
--
ALTER TABLE `attached`
  ADD PRIMARY KEY (`id`);

--
-- テーブルのインデックス `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- テーブルのインデックス `configs`
--
ALTER TABLE `configs`
  ADD PRIMARY KEY (`id`);

--
-- テーブルのインデックス `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`id`);

--
-- テーブルのインデックス `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`id`);

--
-- テーブルのインデックス `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- テーブルのインデックス `videos`
--
ALTER TABLE `videos`
  ADD PRIMARY KEY (`id`);

--
-- ダンプしたテーブルの AUTO_INCREMENT
--

--
-- テーブルの AUTO_INCREMENT `attached`
--
ALTER TABLE `attached`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- テーブルの AUTO_INCREMENT `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- テーブルの AUTO_INCREMENT `configs`
--
ALTER TABLE `configs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- テーブルの AUTO_INCREMENT `items`
--
ALTER TABLE `items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- テーブルの AUTO_INCREMENT `news`
--
ALTER TABLE `news`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- テーブルの AUTO_INCREMENT `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- テーブルの AUTO_INCREMENT `videos`
--
ALTER TABLE `videos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;
