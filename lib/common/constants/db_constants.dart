class DbConstants {
  static const dbName = 'task_your_life.db';
  static const dbVersion = 1;

  // Table creation queries
  static const userTable = '''
      CREATE TABLE users(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        username TEXT NOT NULL,
        email TEXT,
        avatarUrl TEXT,
        isGuest INTEGER DEFAULT 0
      );
    ''';
  static const taskTable = '''
      CREATE TABLE tasks(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        userId INTEGER NOT NULL,
        title TEXT NOT NULL,
        description TEXT,
        dueDate TEXT,
        status INTEGER DEFAULT 0,
        level INTEGER DEFAULT 0,
        FOREIGN KEY(userId) REFERENCES users(id) ON DELETE CASCADE
      );
    ''';
  static const subTaskTable = '''
      CREATE TABLE sub_tasks(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        taskId INTEGER NOT NULL,
        title TEXT NOT NULL,
        status INTEGER DEFAULT 0,
        FOREIGN KEY(taskId) REFERENCES tasks(id) ON DELETE CASCADE
      );
    ''';
}
