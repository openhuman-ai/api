CREATE TABLE users (
	id INTEGER PRIMARY KEY AUTOINCREMENT,
	name VARCHAR(255) NULL,
	username VARCHAR(100) UNIQUE NOT NULL,
	email VARCHAR(255) NULL,
	avatar TEXT,
	exp TIMESTAMP NULL
)

-- Sample data for users table
INSERT INTO users (name, username, email, avatar, exp) VALUES
('John Doe', 'johndoe', 'john@example.com', 'https://avatars.githubusercontent.com/u/1', '2024-03-20 10:00:00'),
('Jane Smith', 'janesmith', 'jane@example.com', 'https://avatars.githubusercontent.com/u/2', '2024-03-21 11:00:00'),
('Alice Johnson', 'alicej', 'alice@example.com', 'https://avatars.githubusercontent.com/u/3', '2024-03-22 12:00:00'),
('Bob Wilson', 'bobw', 'bob@example.com', 'https://avatars.githubusercontent.com/u/4', '2024-03-23 13:00:00'),
('Carol Brown', 'carolb', 'carol@example.com', 'https://avatars.githubusercontent.com/u/5', '2024-03-24 14:00:00'),
('David Lee', 'davidl', 'david@example.com', 'https://avatars.githubusercontent.com/u/6', '2024-03-25 15:00:00'),
('Eva Chen', 'evac', 'eva@example.com', 'https://avatars.githubusercontent.com/u/7', '2024-03-26 16:00:00'),
('Frank Zhang', 'frankz', 'frank@example.com', 'https://avatars.githubusercontent.com/u/8', '2024-03-27 17:00:00');

CREATE TABLE sessions (
    id INT AUTO_INCREMENT PRIMARY KEY,
    session_token VARCHAR(255) NOT NULL,
    user_id CHAR(24) NOT NULL,
    expires DATETIME NOT NULL
)

-- Sample data for sessions table
INSERT INTO sessions (session_token, user_id, expires) VALUES
('sess_token1', '1', '2024-04-20 10:00:00'),
('sess_token2', '2', '2024-04-21 11:00:00'),
('sess_token3', '3', '2024-04-22 12:00:00'),
('sess_token4', '4', '2024-04-23 13:00:00'),
('sess_token5', '5', '2024-04-24 14:00:00'),
('sess_token6', '6', '2024-04-25 15:00:00'),
('sess_token7', '7', '2024-04-26 16:00:00'),
('sess_token8', '8', '2024-04-27 17:00:00'),
('sess_token9', '1', '2024-04-28 18:00:00'),
('sess_token10', '2', '2024-04-29 19:00:00');

CREATE TABLE accounts (
	id INTEGER PRIMARY KEY AUTOINCREMENT,
	access_token TEXT NOT NULL,
	scope TEXT NOT NULL,
	token_type VARCHAR(20) NOT NULL,
	providerAccountId VARCHAR(50) NOT NULL,
	provider VARCHAR(50) NOT NULL,
	type VARCHAR(20) NOT NULL,
	userId CHAR(24) NOT NULL
)

-- Sample data for accounts table
INSERT INTO accounts (access_token, scope, token_type, providerAccountId, provider, type, userId) VALUES
('github_token1', 'read:user,user:email', 'bearer', 'gh_123', 'github', 'oauth', '1'),
('google_token1', 'profile email', 'bearer', 'g_123', 'google', 'oauth', '2'),
('facebook_token1', 'public_profile,email', 'bearer', 'fb_123', 'facebook', 'oauth', '3'),
('twitter_token1', 'read write', 'bearer', 'tw_123', 'twitter', 'oauth', '4'),
('github_token2', 'read:user', 'bearer', 'gh_456', 'github', 'oauth', '5'),
('google_token2', 'profile', 'bearer', 'g_456', 'google', 'oauth', '6'),
('linkedin_token1', 'r_basicprofile', 'bearer', 'li_123', 'linkedin', 'oauth', '7'),
('github_token3', 'read:user,repo', 'bearer', 'gh_789', 'github', 'oauth', '8');
