string cronex = '0 0 13 * * ?';
AccountSchedulable asch = new AccountSchedulable();

system.schedule('accSchedule again', cronex, asch);