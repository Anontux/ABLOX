-- Starter content so the site has something to show: site settings, a few
-- places, catalog items and forum threads. Loaded once, after the schema dump,
-- when the database volume is first created.

INSERT INTO `global`
  (`id`, `ShowingSiteAlert1`, `SiteAlert1`, `ShowingSiteAlert2`, `SiteAlert2`,
   `ShowingSiteAlert3`, `SiteAlert3`, `ShowingSiteAlert4`, `SiteAlert4`,
   `ShowingSiteAlert5`, `SiteAlert5`,
   `maintenanceEnabled`, `maintenance`, `shutdownEnabled`, `shutdown`)
VALUES
  (1, 'no', '', 'no', '', 'no', '', 'no', '', 'no', '', 'no', '', 'no', '');

INSERT INTO `catalog`
  (`id`, `name`, `description`, `thumbnail`, `creatorid`, `buywith`, `price`, `type`, `assetid`)
VALUES
  (1, 'Red Baseball Cap', 'A classic red cap for the brick battlefield.', '/BaseballCapRed.png', 2, 'tix', 25, 'hat', 1001),
  (2, 'Bucket', 'It is a bucket. Wear it on your head.', '/Bucket.png', 2, 'tix', 40, 'hat', 1002),
  (3, 'Gold Teapot', 'The finest teapot in all of Bloxburg.', '/GoldTeapot.png', 2, 'robux', 15, 'hat', 1003),
  (4, 'Sparkle Time Fedora', 'Rare. Shiny. Legendary.', '/MidnightBlueSparkleTimeFedora.png', 2, 'robux', 50, 'hat', 1004),
  (5, 'Viking Helm', 'For raiding and general pillaging.', '/viking.png', 2, 'tix', 60, 'hat', 1005),
  (6, 'Bighead', 'A very large head.', '/Bighead.png', 2, 'tix', 30, 'hat', 1006),
  (7, 'Epic Face', 'The face of a champion.', '/EpicFace.png', 2, 'tix', 20, 'hat', 1007),
  (8, 'Bloxxer Shirt', 'Show everyone you mean business.', '/Bloxxer.png', 2, 'tix', 35, 'shirt', 1008);

INSERT INTO `games`
  (`id`, `name`, `description`, `thumbnail`, `players`, `favorites`, `creator_id`, `ip`, `port`, `playerlimit`)
VALUES
  (1, 'The Iron Cafe', 'Hang out, order a burger and meet other bloxxers at the Iron Cafe.', '/IroncafeThumbnail.png', 3, 12, 2, '127.0.0.1', '53640', 12),
  (2, 'Roblox Madness', 'Pure chaos. Brick battle until the last bloxxer stands.', '/RobloxMadness.png', 5, 9, 2, '127.0.0.1', '53641', 12),
  (3, 'Teapot Tower', 'Climb the tower. Do not drop the teapot.', '/TEAPOT.png', 1, 4, 2, '127.0.0.1', '53642', 10),
  (4, 'Bloxxer Arena', 'Slingshots and rockets. Classic brick battle.', '/Bloxxer.png', 0, 6, 2, '127.0.0.1', '53643', 16);

-- Sub-forums live in `topics` (category = forumgroups.id), threads in `forum`
-- (category = topics.id).
INSERT INTO `topics` (`id`, `name`, `description`, `category`)
VALUES
  (1, 'General Discussion', 'Talk about anything NOUNBLOX.', 1),
  (2, 'Help', 'Ask questions and get help with the site.', 2),
  (3, 'Off Topic', 'Anything that does not fit anywhere else.', 3);

INSERT INTO `forum`
  (`id`, `author`, `reply_to`, `title`, `content`, `time_posted`, `category`,
   `is_pinned`, `is_locked`, `is_important`, `is_announcement`, `views`, `bump`)
VALUES
  (1, 2, 0, 'Welcome to NOUNBLOX', 'Welcome! Make an account, pick a place and start playing.', UNIX_TIMESTAMP(), 1, 1, 0, 1, 0, 0, UNIX_TIMESTAMP()),
  (2, 2, 0, 'How do I get started?', 'Register an account, then browse the Games page to find a place to visit.', UNIX_TIMESTAMP(), 1, 0, 0, 0, 0, 0, UNIX_TIMESTAMP()),
  (3, 2, 0, 'What is your favourite hat?', 'The Gold Teapot is clearly the best item in the catalog.', UNIX_TIMESTAMP(), 1, 0, 0, 0, 0, 0, UNIX_TIMESTAMP());
