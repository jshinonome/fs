.fs.cwd:{
    path: hsym `$first -3#(value .z.s);
    {any x like/: ("*src*";"*pkg*")} .fs.getParent/ path
 };

.fs.getParent:{[path] vs[`;path]@0};

.fs.exists:{[path] $[(type key path) in 11 -11h;1b;0b]};

.fs.saveAsCsv:{[filepath;data]
    filepath: $[filepath like "*.csv";filepath;` sv filepath,`csv];
    :filepath 0: csv 0: data
 };

.fs.loop:{[path]
    files: list where 0 > ('[type;key]) each paths: {` sv x,y}[path;] each list: key path;
    dirs: paths where 0 < ('[type;key]) each paths;
    : (flip `dir`file!((count files)#path;files)) uj  (uj/) .fs.loop each dirs
 };
