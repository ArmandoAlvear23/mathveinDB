SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mathvein`
--
CREATE DATABASE IF NOT EXISTS `mathveinDB` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;
USE `mathveinDB`;

-- --------------------------------------------------------

--
-- Table structure for table `activities`
--

CREATE TABLE `activities` (
  `activity_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `exercise_id` int(11) DEFAULT NULL,
  `meal_id` int(11) DEFAULT NULL,
  `sleep_id` int(11) DEFAULT NULL,
  `work_id` int(11) DEFAULT NULL,
  `type` int(11) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `alerts`
--

CREATE TABLE `alerts` (
  `alert_id` int(11) NOT NULL,
  `flags_id` int(11) NOT NULL,
  `notifications_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `vh_id` int(11) NOT NULL,
  `front_snapshot` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `back_snapshot` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `location` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `time_inactive` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `contact_id` int(11) NOT NULL,
  `fname` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `lname` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `email` varchar(50) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


--
-- Table structure for table `current_vitals`
--

CREATE TABLE `current_vitals` (
  `user_id` int(11) NOT NULL,
  `systolic` int(11) NOT NULL,
  `diastolic` int(11) NOT NULL,
  `blood_glucose` double NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Table structure for table `exercises`
--

CREATE TABLE `exercises` (
  `exercise_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `description` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `intensity` int(11) NOT NULL,
  `start_time` time NOT NULL,
  `end_time` time NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `start_time_am_pm` int(1) DEFAULT NULL,
  `end_time_am_pm` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Table structure for table `flags`
--

CREATE TABLE `flags` (
  `flags_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `time_inactive_flag` int(11) DEFAULT '0',
  `bpm_lower_flag` int(11) DEFAULT '0',
  `bpm_upper_flag` int(11) DEFAULT '0',
  `battery_flag` int(11) DEFAULT '0',
  `help_flag` int(11) DEFAULT '0',
  `phone_hrs_flag` int(11) DEFAULT '0',
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Table structure for table `log`
--

CREATE TABLE `log` (
  `log_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `description` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE `login` (
  `login_id` int(11) NOT NULL,
  `email` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `pass` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `contact_id` int(11) DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Table structure for table `meals`
--

CREATE TABLE `meals` (
  `meal_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `appetizer` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `main` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dessert` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `snack` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `drink` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Table structure for table `monitoring_mode`
--

CREATE TABLE `monitoring_mode` (
  `user_id` int(11) NOT NULL,
  `bpm1` int(11) NOT NULL DEFAULT '0',
  `bpm2` int(11) NOT NULL DEFAULT '0',
  `bpm3` int(11) NOT NULL DEFAULT '0',
  `bpm_counter` int(11) NOT NULL DEFAULT '1',
  `bpm_average` int(11) NOT NULL DEFAULT '0',
  `monitor_mode` int(11) NOT NULL DEFAULT '0',
  `no_input_flag` int(11) NOT NULL DEFAULT '0',
  `alert_flag` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `notifications_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `flags_id` int(11) NOT NULL,
  `flag_type` int(11) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Table structure for table `relationships`
--

CREATE TABLE `relationships` (
  `user_id` int(11) NOT NULL,
  `contact_id` int(11) NOT NULL,
  `c_relationship` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `user_id` int(11) NOT NULL,
  `bpm_low_limit` int(11) NOT NULL DEFAULT '45',
  `bpm_high_limit` int(11) NOT NULL DEFAULT '120',
  `bpm_interval_sec` int(11) NOT NULL DEFAULT '5',
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Table structure for table `sleep`
--

CREATE TABLE `sleep` (
  `sleep_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `start_time` time NOT NULL,
  `end_time` time NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `start_time_am_pm` int(1) DEFAULT NULL,
  `end_time_am_pm` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `fname` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `lname` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `weight_lb` double DEFAULT '0',
  `height_ft` int(11) DEFAULT '0',
  `height_in` double DEFAULT '0',
  `dob` date NOT NULL,
  `contacts_count` int(11) NOT NULL DEFAULT '0',
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `create_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Table structure for table `vitals_history`
--

CREATE TABLE `vitals_history` (
  `vh_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `systolic` int(11) NOT NULL,
  `diastolic` int(11) NOT NULL,
  `blood_glucose` double NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Table structure for table `work`
--

CREATE TABLE `work` (
  `work_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `description` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `intensity` int(11) NOT NULL,
  `start_time` time NOT NULL,
  `end_time` time NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `start_time_am_pm` int(1) DEFAULT NULL,
  `end_time_am_pm` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `activities`
--
ALTER TABLE `activities`
  ADD PRIMARY KEY (`activity_id`,`user_id`),
  ADD KEY `users_activities_history` (`user_id`),
  ADD KEY `exercise_activity` (`exercise_id`,`user_id`),
  ADD KEY `meal_activity` (`meal_id`,`user_id`),
  ADD KEY `sleep_activity` (`sleep_id`,`user_id`),
  ADD KEY `work_activity` (`work_id`,`user_id`);

--
-- Indexes for table `alerts`
--
ALTER TABLE `alerts`
  ADD PRIMARY KEY (`alert_id`,`flags_id`,`notifications_id`,`user_id`,`vh_id`),
  ADD KEY `notifications_alerts` (`notifications_id`,`user_id`,`flags_id`),
  ADD KEY `current_vitals_alerts` (`vh_id`,`user_id`);

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`contact_id`);

--
-- Indexes for table `current_vitals`
--
ALTER TABLE `current_vitals`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `exercises`
--
ALTER TABLE `exercises`
  ADD PRIMARY KEY (`exercise_id`,`user_id`),
  ADD KEY `users_exercise_history` (`user_id`);

--
-- Indexes for table `flags`
--
ALTER TABLE `flags`
  ADD PRIMARY KEY (`flags_id`,`user_id`),
  ADD KEY `users_flags` (`user_id`);

--
-- Indexes for table `log`
--
ALTER TABLE `log`
  ADD PRIMARY KEY (`log_id`),
  ADD KEY `users_logs` (`user_id`);

--
-- Indexes for table `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`login_id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `users_login_info` (`user_id`),
  ADD KEY `contacts_login_info` (`contact_id`);

--
-- Indexes for table `meals`
--
ALTER TABLE `meals`
  ADD PRIMARY KEY (`meal_id`,`user_id`),
  ADD KEY `users_meal_history` (`user_id`);

--
-- Indexes for table `monitoring_mode`
--
ALTER TABLE `monitoring_mode`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`notifications_id`,`user_id`,`flags_id`),
  ADD KEY `users_notifications` (`user_id`),
  ADD KEY `flags_notifications` (`flags_id`,`user_id`);

--
-- Indexes for table `relationships`
--
ALTER TABLE `relationships`
  ADD KEY `relationships__user_id` (`user_id`),
  ADD KEY `contacts_users_relationships` (`contact_id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `sleep`
--
ALTER TABLE `sleep`
  ADD PRIMARY KEY (`sleep_id`,`user_id`),
  ADD KEY `users_sleep_history` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `vitals_history`
--
ALTER TABLE `vitals_history`
  ADD PRIMARY KEY (`vh_id`,`user_id`),
  ADD KEY `users_vitals_history` (`user_id`);

--
-- Indexes for table `work`
--
ALTER TABLE `work`
  ADD PRIMARY KEY (`work_id`,`user_id`),
  ADD KEY `users_work_history` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `activities`
--
ALTER TABLE `activities`
  MODIFY `activity_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `alerts`
--
ALTER TABLE `alerts`
  MODIFY `alert_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `contact_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `exercises`
--
ALTER TABLE `exercises`
  MODIFY `exercise_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `flags`
--
ALTER TABLE `flags`
  MODIFY `flags_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=166;

--
-- AUTO_INCREMENT for table `log`
--
ALTER TABLE `log`
  MODIFY `log_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `login`
--
ALTER TABLE `login`
  MODIFY `login_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `meals`
--
ALTER TABLE `meals`
  MODIFY `meal_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `notifications_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `sleep`
--
ALTER TABLE `sleep`
  MODIFY `sleep_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `vitals_history`
--
ALTER TABLE `vitals_history`
  MODIFY `vh_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `work`
--
ALTER TABLE `work`
  MODIFY `work_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `activities`
--
ALTER TABLE `activities`
  ADD CONSTRAINT `exercise_activity` FOREIGN KEY (`exercise_id`,`user_id`) REFERENCES `exercises` (`exercise_id`, `user_id`),
  ADD CONSTRAINT `meal_activity` FOREIGN KEY (`meal_id`,`user_id`) REFERENCES `meals` (`meal_id`, `user_id`),
  ADD CONSTRAINT `sleep_activity` FOREIGN KEY (`sleep_id`,`user_id`) REFERENCES `sleep` (`sleep_id`, `user_id`),
  ADD CONSTRAINT `users_activities_history` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `work_activity` FOREIGN KEY (`work_id`,`user_id`) REFERENCES `work` (`work_id`, `user_id`);

--
-- Constraints for table `alerts`
--
ALTER TABLE `alerts`
  ADD CONSTRAINT `current_vitals_alerts` FOREIGN KEY (`vh_id`,`user_id`) REFERENCES `vitals_history` (`vh_id`, `user_id`),
  ADD CONSTRAINT `notifications_alerts` FOREIGN KEY (`notifications_id`,`user_id`,`flags_id`) REFERENCES `notifications` (`notifications_id`, `user_id`, `flags_id`);

--
-- Constraints for table `current_vitals`
--
ALTER TABLE `current_vitals`
  ADD CONSTRAINT `users_current_vitals` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `exercises`
--
ALTER TABLE `exercises`
  ADD CONSTRAINT `users_exercise_history` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `flags`
--
ALTER TABLE `flags`
  ADD CONSTRAINT `users_flags` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `log`
--
ALTER TABLE `log`
  ADD CONSTRAINT `users_logs` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `login`
--
ALTER TABLE `login`
  ADD CONSTRAINT `contacts_login_info` FOREIGN KEY (`contact_id`) REFERENCES `contacts` (`contact_id`),
  ADD CONSTRAINT `users_login_info` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE;

--
-- Constraints for table `meals`
--
ALTER TABLE `meals`
  ADD CONSTRAINT `users_meal_history` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `monitoring_mode`
--
ALTER TABLE `monitoring_mode`
  ADD CONSTRAINT `users_monitoring_mode` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `notifications`
--
ALTER TABLE `notifications`
  ADD CONSTRAINT `flags_notifications` FOREIGN KEY (`flags_id`,`user_id`) REFERENCES `flags` (`flags_id`, `user_id`),
  ADD CONSTRAINT `users_notifications` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `relationships`
--
ALTER TABLE `relationships`
  ADD CONSTRAINT `contacts_users_relationships` FOREIGN KEY (`contact_id`) REFERENCES `contacts` (`contact_id`),
  ADD CONSTRAINT `users_contacts_relationships` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `settings`
--
ALTER TABLE `settings`
  ADD CONSTRAINT `users_settings` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `sleep`
--
ALTER TABLE `sleep`
  ADD CONSTRAINT `users_sleep_history` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `vitals_history`
--
ALTER TABLE `vitals_history`
  ADD CONSTRAINT `users_vitals_history` FOREIGN KEY (`user_id`) REFERENCES `current_vitals` (`user_id`);

--
-- Constraints for table `work`
--
ALTER TABLE `work`
  ADD CONSTRAINT `users_work_history` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
