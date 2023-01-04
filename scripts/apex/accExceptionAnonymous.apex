try{
    string s;
    s.toLowerCase();
    account ac = new account();
    insert ac;
} catch(DmlException dex){
    system.debug('DML went wrong');
} catch(Exception ex){
    system.debug('something went wrong buddy');
    system.debug('exception message: ' + ex.getMessage());
    system.debug('ex line number: ' + ex.getLineNumber());
}

system.debug('Apex is SIMPLE');