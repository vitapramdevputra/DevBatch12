//creating new instance.
//if we HAVE ANOTHER CONSTURCTOR./
// we must have parameter-less constructor also.
cat sfCat = new cat();//NO CONSTUCTOR.
sfCat.name = 'ginger';
sfCat.color = 'orange';
system.debug('sf cat ' + sfCat);

cat batch12Cat = new cat('fluffykins', 'white');
system.debug('batch12 cat ' + batch12Cat);


cat batch12Cat2 = new cat('simba', 'brown');
system.debug('batch12 cat ' + batch12Cat2);


cat batch12Cat3 = new cat('blackpepper', 'black');
system.debug('batch12 cat ' + batch12Cat3);

system.debug('number of cats => ' + cat.countCat);