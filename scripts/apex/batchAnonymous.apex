AccountsBatch ab = new AccountsBatch();
Id jobId = database.executeBatch(ab, 10);