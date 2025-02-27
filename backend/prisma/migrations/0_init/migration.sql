-- CreateTable
CREATE TABLE `event_attendees` (
    `attendance_id` INTEGER NOT NULL,
    `event_id` INTEGER NULL,
    `user_id` INTEGER NULL,
    `Time_stam` DATETIME(0) NULL,
    `is_approved` BOOLEAN NULL,
    `has_attended` BOOLEAN NULL,

    INDEX `event_id`(`event_id`),
    INDEX `user_id`(`user_id`),
    PRIMARY KEY (`attendance_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `events` (
    `event_id` INTEGER NOT NULL,
    `organizer_id` INTEGER NULL,
    `event_name` VARCHAR(255) NULL,
    `description` TEXT NULL,
    `start_date` DATETIME(0) NULL,
    `end_date` DATETIME(0) NULL,
    `venue_id` INTEGER NULL,
    `event_type` ENUM('online', 'offline', 'hybrid') NULL,
    `time_zone` VARCHAR(255) NULL,

    INDEX `organizer_id`(`organizer_id`),
    INDEX `venue_id`(`venue_id`),
    PRIMARY KEY (`event_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `organizers` (
    `organizer_id` INTEGER NOT NULL,
    `user_id` INTEGER NULL,
    `organization_name` VARCHAR(255) NULL,
    `about` TEXT NULL,

    UNIQUE INDEX `user_id`(`user_id`),
    PRIMARY KEY (`organizer_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `users` (
    `user_id` INTEGER NOT NULL,
    `username` VARCHAR(255) NULL,
    `password_hash` VARCHAR(255) NULL,
    `email` VARCHAR(255) NULL,
    `first_name` VARCHAR(255) NULL,
    `last_name` VARCHAR(255) NULL,
    `user_type` ENUM('attendee', 'organizer', 'admin') NULL,
    `joined` DATETIME(0) NULL,
    `last_login` DATETIME(0) NULL,

    UNIQUE INDEX `username`(`username`),
    UNIQUE INDEX `email`(`email`),
    PRIMARY KEY (`user_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `venues` (
    `venue_id` INTEGER NOT NULL,
    `venue_name` VARCHAR(255) NULL,
    `address` TEXT NULL,
    `capacity` INTEGER NULL,

    PRIMARY KEY (`venue_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `event_attendees` ADD CONSTRAINT `event_attendees_ibfk_1` FOREIGN KEY (`event_id`) REFERENCES `events`(`event_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `event_attendees` ADD CONSTRAINT `event_attendees_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users`(`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `events` ADD CONSTRAINT `events_ibfk_1` FOREIGN KEY (`organizer_id`) REFERENCES `organizers`(`organizer_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `events` ADD CONSTRAINT `events_ibfk_2` FOREIGN KEY (`venue_id`) REFERENCES `venues`(`venue_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `organizers` ADD CONSTRAINT `organizers_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users`(`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

