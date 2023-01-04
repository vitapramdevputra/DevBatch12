Account ac1 = new account();
ac1.Name = 'abc';
ac1.Industry = 'Energy';

account ac2 = new account();
ac2.Name = 'xyz';

account ac3 = new account();
account ac4 = new account();

list<account> listAcc = new list<account>{ac1, ac2, ac3,ac4};

//false -> insert good guys. do not insert bad ones.
//true -> if there is any 1 bad guy, don't insert ANYTHING.
List<Database.SaveResult> results = Database.insert(listAcc,false);

for (Database.SaveResult r : results) {
    //isSuccess() -> returs booleans
    //getid() -> returns id
    //if not success, then getErrors() -> returns List<DAtabase.Error>
    if (r.isSuccess()) {
        system.debug('record inserted successfully. recod id is: ' + r.getId());
    } else {
        system.debug('errored out. error is ... ' + r.getErrors());
    }
}