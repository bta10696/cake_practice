-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- ホスト: localhost:8889
-- 生成日時: 2022 年 8 月 02 日 06:07
-- サーバのバージョン： 5.7.34
-- PHP のバージョン: 7.4.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

--
-- データベース: `mizuha`
--

-- --------------------------------------------------------

--
-- テーブルの構造 `agent`
--

CREATE TABLE `agent` (
  `id` int(11) NOT NULL,
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `status` enum('draft','publish') NOT NULL DEFAULT 'draft',
  `title` varchar(100) NOT NULL,
  `position` int(11) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- テーブルのデータのダンプ `agent`
--

INSERT INTO `agent` (`id`, `created`, `modified`, `status`, `title`, `position`) VALUES
(1, '2022-08-02 01:46:27', '2022-08-02 01:46:54', 'draft', 'test 1', 1),
(2, '2022-08-02 01:46:42', '2022-08-02 01:46:54', 'draft', 'test 2', 2);

-- --------------------------------------------------------

--
-- テーブルの構造 `agenten`
--

CREATE TABLE `agenten` (
  `id` int(11) NOT NULL,
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `status` enum('draft','publish') NOT NULL DEFAULT 'draft',
  `title` varchar(100) NOT NULL,
  `position` int(11) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- テーブルのデータのダンプ `agenten`
--

INSERT INTO `agenten` (`id`, `created`, `modified`, `status`, `title`, `position`) VALUES
(1, '2022-08-02 02:10:28', '2022-08-02 02:19:44', 'publish', 'English agent 1', 1),
(2, '2022-08-02 02:19:39', '2022-08-02 02:19:44', 'draft', 'English Agent test 2', 2);

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
(22, 5, 'Videosen', 'b9840090ccb320c6c79e602353e4c350_16593229067405.jpeg', 'caaa.jpeg', 5528, 'jpeg', 'images', '2022-08-01 03:01:49', NULL),
(23, 2, 'News', '66c02d297b6e43c19fafc006c8f0d6ef_16593234146797.pdf', 'hinh-anh-dep-ve-hoa-sen-converted 2.pdf', 53122, 'pdf', 'files', '2022-08-01 03:10:17', NULL),
(24, 2, 'News', '66c02d297b6e43c19fafc006c8f0d6ef_16593234099810.jpeg', 'aaa.jpeg', 625612, 'jpeg', 'images', '2022-08-01 03:10:17', NULL),
(25, 1, 'Newsen', 'ec74a42e7e8de642074f4fca62f58c11_16593244729641.pdf', 'hinh-anh-dep-ve-hoa-sen-converted 2.pdf', 53122, 'pdf', 'files', '2022-08-01 03:27:54', NULL),
(26, 1, 'Newsen', 'ec74a42e7e8de642074f4fca62f58c11_16593244696200.jpeg', '2008150935-Mo-let-la-gii.jpeg', 89134, 'jpeg', 'images', '2022-08-01 03:27:54', NULL),
(32, 2, 'Newsen', '2733d54e016f3d76bb38c72408b6a2da_16593303826514.pdf', 'hinh-anh-dep-ve-hoa-sen-converted 2.pdf', 53122, 'pdf', 'files', '2022-08-01 05:10:05', NULL),
(33, 2, 'Newsen', '2733d54e016f3d76bb38c72408b6a2da_16593303768892.jpeg', 'aaa.jpeg', 625612, 'jpeg', 'images', '2022-08-01 05:10:05', NULL),
(41, 1, 'Agent', 'd50e938bfce5f04063d81c2f9e2a7adb_16594047801592.pdf', 'hinh-anh-dep-ve-hoa-sen-converted 2.pdf', 53122, 'pdf', 'files', '2022-08-02 01:46:27', NULL),
(42, 1, 'Agent', 'd50e938bfce5f04063d81c2f9e2a7adb_16594047715609.jpeg', 'az.jpeg', 23708, 'jpeg', 'images', '2022-08-02 01:46:27', NULL),
(43, 2, 'Agent', 'aa35281b883bd0b71df59e981cbbd89d_16594048006652.jpeg', 'best-it-image.jpeg', 155607, 'jpeg', 'images', '2022-08-02 01:46:43', NULL),
(44, 1, 'Agenten', '306495ac8ce24141274c7f0ac997c5b2_16594062259324.pdf', 'hinh-anh-dep-ve-hoa-sen-converted 2.pdf', 53122, 'pdf', 'files', '2022-08-02 02:10:28', NULL),
(45, 1, 'Agenten', '306495ac8ce24141274c7f0ac997c5b2_16594062142825.jpeg', 'az.jpeg', 23708, 'jpeg', 'images', '2022-08-02 02:10:28', NULL),
(46, 2, 'Agenten', '2b8f47e590e74959d83fecaf2702e472_16594067784031.pdf', '勤怠届原紙 2016.12 のコピー - Google ドキュメント.pdf', 92973, 'pdf', 'files', '2022-08-02 02:19:39', NULL),
(47, 2, 'Agenten', '2b8f47e590e74959d83fecaf2702e472_16594067712513.jpeg', '2008150935-Mo-let-la-gii.jpeg', 89134, 'jpeg', 'images', '2022-08-02 02:19:39', NULL),
(48, 3, 'News', '9fce1455afcdcd93afb4443161877749_16594105634720.pdf', 'hinh-anh-dep-ve-hoa-sen-converted 2.pdf', 53122, 'pdf', 'files', '2022-08-02 03:22:44', NULL),
(49, 3, 'News', '9fce1455afcdcd93afb4443161877749_16594105585828.jpeg', 'az.jpeg', 23708, 'jpeg', 'images', '2022-08-02 03:22:44', NULL),
(50, 4, 'Newsen', '87ca9c4d9c3c2375772229503b48fe21_16594176475305.pdf', 'hinh-anh-dep-ve-hoa-sen-converted 2.pdf', 53122, 'pdf', 'files', '2022-08-02 05:20:49', NULL),
(51, 4, 'Newsen', '87ca9c4d9c3c2375772229503b48fe21_16594176441508.jpeg', 'best-it-image.jpeg', 155607, 'jpeg', 'images', '2022-08-02 05:20:49', NULL);

-- --------------------------------------------------------

--
-- テーブルの構造 `categoriesen`
--

CREATE TABLE `categoriesen` (
  `id` int(11) NOT NULL,
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `status` enum('draft','publish') NOT NULL DEFAULT 'draft',
  `category_name` varchar(100) NOT NULL,
  `type` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- テーブルのデータのダンプ `categoriesen`
--

INSERT INTO `categoriesen` (`id`, `created`, `modified`, `status`, `category_name`, `type`) VALUES
(2, '2022-08-01 03:02:07', '2022-08-01 03:02:11', 'publish', 'test eng category', NULL),
(3, '2022-08-01 05:09:48', '2022-08-01 05:09:53', 'publish', 'English Test', NULL);

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
  `type` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- テーブルのデータのダンプ `category`
--

INSERT INTO `category` (`id`, `created`, `modified`, `status`, `category_name`, `type`) VALUES
(1, '2022-07-29 12:40:57', '2022-07-29 06:51:11', 'publish', 'イベント', NULL),
(2, '2022-07-29 12:40:57', '2022-07-29 06:49:55', 'publish', 'お知らせ', NULL);

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
(5, 'お知らせ', 'news', 2, 'jp', '2022-07-29 00:15:16', '2022-07-29 10:36:23'),
(6, 'よくある質問', 'fqa', 2, 'jp', '2022-07-29 01:03:19', '2022-07-29 10:36:26'),
(7, 'カテゴリー', 'category', 2, 'jp', '2022-07-29 01:05:28', '2022-07-29 10:36:27'),
(9, '動画', 'videos', 2, 'jp', '2022-07-29 07:23:24', '2022-08-01 10:44:27'),
(13, 'NEWS', 'newsen', 2, 'en', '2022-08-01 01:42:56', '2022-08-01 10:44:46'),
(14, 'FAQ', 'fqaen', 2, 'en', '2022-08-01 01:43:29', '2022-08-01 10:44:49'),
(15, 'CATEGORIES', 'categoriesen', 2, 'en', '2022-08-01 01:43:56', '2022-08-01 10:44:52'),
(16, 'VIDEOS', 'videosen', 2, 'en', '2022-08-01 01:44:18', '2022-08-01 10:44:56'),
(17, '代理店専用ページ', 'agent', 2, 'jp', '2022-08-02 01:11:42', '2022-08-02 10:29:26'),
(18, 'AGENTS', 'agenten', 2, 'en', '2022-08-02 02:00:56', '2022-08-02 11:01:18');

-- --------------------------------------------------------

--
-- テーブルの構造 `fqa`
--

CREATE TABLE `fqa` (
  `id` int(11) NOT NULL,
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `status` enum('draft','publish') NOT NULL DEFAULT 'draft',
  `question` varchar(255) NOT NULL,
  `answer` text NOT NULL,
  `position` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- テーブルのデータのダンプ `fqa`
--

INSERT INTO `fqa` (`id`, `created`, `modified`, `status`, `question`, `answer`, `position`) VALUES
(1, '2022-07-29 06:45:44', '2022-07-29 06:46:19', 'publish', 'Q1', 'A1\r\n\r\nsss', 1),
(2, '2022-07-29 06:45:54', '2022-07-29 06:46:19', 'publish', 'Q2', 'A2\r\nA2', 2);

-- --------------------------------------------------------

--
-- テーブルの構造 `fqaen`
--

CREATE TABLE `fqaen` (
  `id` int(11) NOT NULL,
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `status` enum('draft','publish') NOT NULL DEFAULT 'draft',
  `question` varchar(255) NOT NULL,
  `answer` text NOT NULL,
  `position` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- テーブルのデータのダンプ `fqaen`
--

INSERT INTO `fqaen` (`id`, `created`, `modified`, `status`, `question`, `answer`, `position`) VALUES
(1, '2022-08-01 02:34:58', '2022-08-01 02:39:15', 'draft', 'english', 'english', 2),
(2, '2022-08-01 02:39:11', '2022-08-01 02:39:15', 'draft', 'test english', 'test english', 1);

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

--
-- テーブルのデータのダンプ `news`
--

INSERT INTO `news` (`id`, `created`, `modified`, `position`, `status`, `title`, `content`, `publish_at`, `category_id`) VALUES
(1, '2022-07-29 03:12:32', '2022-08-02 03:22:44', 3, 'publish', '1234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890', '<p>本文</p><h1>見出し１</h1><h2>見出し２</h2><h3>見出し３</h3><h2 class=\"article--ttl\">見出し（カスタム）</h2><p>&nbsp;</p><p><span style=\"font-family:\'Times New Roman\', Times, serif;\">font-family</span></p><p>&nbsp;</p><p><span style=\"font-size:23px;\">font size</span></p><p><span style=\"color:hsl(120,75%,60%);\">color</span></p><p><span style=\"background-color:hsl(270,75%,60%);color:hsl(0,0%,100%);\">background&nbsp;</span></p><p><span style=\"background-color:hsl(0,0%,100%);color:hsl(0,0%,0%);\"><strong>B</strong></span></p><p><span style=\"background-color:hsl(0,0%,100%);color:hsl(0,0%,0%);\"><i>i</i></span></p><p><u>u</u></p><p><s>s</s></p><p>left</p><p style=\"text-align:center;\">center</p><p style=\"text-align:right;\">right</p><ol><li>list 1</li><li>list 2</li></ol><ul style=\"list-style-type:square;\"><li>list .</li><li>list .</li></ul><p style=\"margin-left:40px;\"><span style=\"background-color:rgb(255,255,255);color:rgb(54,54,55);font-size:15px;\">The same table can be used multiple times to define different types of associations. For example consider a case where you want to separate approved comments and those that have not been moderated yet:</span></p><p><a href=\"google.com\">link</a></p><p style=\"text-align:center;\"><a class=\"btn btn-primary link-button\" style=\"color:#fff;text-decoration:none;\" href=\"caters.co.jp\" role=\"button\">link button</a></p><blockquote><p>code 1</p><p>code 2</p></blockquote><figure class=\"image image_resized\" style=\"width:11.45%;\"><img src=\"/upload/News/1/images/fe499d8710b81d0840e33d32dbf03599_16590634992147.png\"></figure><figure class=\"media\"><div data-oembed-url=\"https://www.youtube.com/watch?v=CIWD9fYmDig\"><div style=\"position: relative; padding-bottom: 100%; height: 0; padding-bottom: 56.2493%;\"><iframe src=\"https://www.youtube.com/embed/CIWD9fYmDig\" style=\"position: absolute; width: 100%; height: 100%; top: 0; left: 0;\" frameborder=\"0\" allow=\"autoplay; encrypted-media\" allowfullscreen=\"\"></iframe></div></div></figure><p><a class=\"is_file pdf\" target=\"_blank\" href=\"/upload/News/1/files/fe499d8710b81d0840e33d32dbf03599_16590635549563.pdf\">1234567890.pdf</a><a class=\"is_file doc\" href=\"/upload/News/1/files/fe499d8710b81d0840e33d32dbf03599_16590635550237.docx\">a8b59cd8eff0dc6c66fd1039321d99f9_16565678386003.docx</a></p><p>&nbsp;</p>', '2022-07-29 12:29:00', 1),
(2, '2022-08-01 03:10:17', '2022-08-02 03:22:50', 2, 'publish', 'English Category Test', '<p>English Category Test</p>', '2022-08-03 12:09:00', 2),
(3, '2022-08-02 03:22:44', '2022-08-02 03:22:49', 1, 'publish', 'test', '<p>aaaaaa</p>', NULL, 1);

-- --------------------------------------------------------

--
-- テーブルの構造 `newsen`
--

CREATE TABLE `newsen` (
  `id` int(11) NOT NULL,
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `position` int(11) NOT NULL DEFAULT '0',
  `status` enum('draft','publish') NOT NULL DEFAULT 'draft',
  `title` varchar(100) NOT NULL DEFAULT '',
  `content` text NOT NULL,
  `publish_at` datetime DEFAULT NULL,
  `category_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- テーブルのデータのダンプ `newsen`
--

INSERT INTO `newsen` (`id`, `created`, `modified`, `position`, `status`, `title`, `content`, `publish_at`, `category_id`) VALUES
(1, '2022-08-01 03:27:54', '2022-08-02 05:20:49', 3, 'publish', 'English Category Test', '<p>English Category Test</p>', '2022-08-01 12:28:00', 2),
(2, '2022-08-01 05:06:24', '2022-08-02 05:26:47', 1, 'publish', 'English test 2', '<p>test</p>', '2022-08-10 14:05:00', 3),
(4, '2022-08-02 05:20:49', '2022-08-02 05:26:47', 2, 'draft', 'XXX', '<p>xxx</p>', NULL, 3);

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
(2, '2022-07-28 09:22:41', '2022-08-01 05:04:07', 'mizuha_admin', '$2y$10$CUHztQWd/wnhbWXQkrXfTO16fZ5Bc2b8JmFcr7bb0XrJ4VpqkDVJe', 'MIZ', 'miz-admin@mizuha-nippon.jp', 'publish', 1),
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

-- --------------------------------------------------------

--
-- テーブルの構造 `videosen`
--

CREATE TABLE `videosen` (
  `id` int(11) NOT NULL,
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `code` varchar(100) NOT NULL,
  `title` varchar(100) NOT NULL,
  `status` enum('draft','publish') NOT NULL DEFAULT 'draft',
  `position` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- テーブルのデータのダンプ `videosen`
--

INSERT INTO `videosen` (`id`, `created`, `modified`, `code`, `title`, `status`, `position`) VALUES
(3, '2022-08-01 03:00:44', '2022-08-01 05:17:06', 'https://www.youtube.com/watch?v=v-FNXUcz6R4', 'test eng video', 'draft', 1),
(5, '2022-08-01 03:01:48', '2022-08-01 05:17:06', 'https://www.youtube.com/watch?v=v-FNXUcz6R4', 'test 2', 'draft', 2);

--
-- ダンプしたテーブルのインデックス
--

--
-- テーブルのインデックス `agent`
--
ALTER TABLE `agent`
  ADD PRIMARY KEY (`id`);

--
-- テーブルのインデックス `agenten`
--
ALTER TABLE `agenten`
  ADD PRIMARY KEY (`id`);

--
-- テーブルのインデックス `attached`
--
ALTER TABLE `attached`
  ADD PRIMARY KEY (`id`);

--
-- テーブルのインデックス `categoriesen`
--
ALTER TABLE `categoriesen`
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
-- テーブルのインデックス `fqa`
--
ALTER TABLE `fqa`
  ADD PRIMARY KEY (`id`);

--
-- テーブルのインデックス `fqaen`
--
ALTER TABLE `fqaen`
  ADD PRIMARY KEY (`id`);

--
-- テーブルのインデックス `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`id`);

--
-- テーブルのインデックス `newsen`
--
ALTER TABLE `newsen`
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
-- テーブルのインデックス `videosen`
--
ALTER TABLE `videosen`
  ADD PRIMARY KEY (`id`);

--
-- ダンプしたテーブルの AUTO_INCREMENT
--

--
-- テーブルの AUTO_INCREMENT `agent`
--
ALTER TABLE `agent`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- テーブルの AUTO_INCREMENT `agenten`
--
ALTER TABLE `agenten`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- テーブルの AUTO_INCREMENT `attached`
--
ALTER TABLE `attached`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- テーブルの AUTO_INCREMENT `categoriesen`
--
ALTER TABLE `categoriesen`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- テーブルの AUTO_INCREMENT `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- テーブルの AUTO_INCREMENT `configs`
--
ALTER TABLE `configs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- テーブルの AUTO_INCREMENT `fqa`
--
ALTER TABLE `fqa`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- テーブルの AUTO_INCREMENT `fqaen`
--
ALTER TABLE `fqaen`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- テーブルの AUTO_INCREMENT `news`
--
ALTER TABLE `news`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- テーブルの AUTO_INCREMENT `newsen`
--
ALTER TABLE `newsen`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

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

--
-- テーブルの AUTO_INCREMENT `videosen`
--
ALTER TABLE `videosen`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;
