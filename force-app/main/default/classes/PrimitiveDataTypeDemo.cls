//class
public class PrimitiveDataTypeDemo {
    //method
    public void printBasicDataType(){
        system.debug('printing datatypes');
        string batchName = 'Batch 12';
        integer totalCandidates = 65;
        boolean isAdminCompleted = true;

        system.debug('batch name is ... ' + batchName);
        system.debug('total Candidates  are ... ' + totalCandidates);
        system.debug('is admin completed? ' + isAdminCompleted);

        Decimal decValue = 998.99;
        system.debug('decimal value is ' + decValue);

        long longValue = 987654619879465464l;
        system.debug('long value is ' + longValue);
    }

    public void printBasicDataType2(){
        Object ob1 = 'string datatype in object';
        object ob2 = 77;
        object ob3 = true;

        system.debug(ob1);
        system.debug(ob2);
        system.debug(ob3);

        Id accId = '0015h000014R11WAAS';
        system.debug('acc id is ' + accId);
    }
}
