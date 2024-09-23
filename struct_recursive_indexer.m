%% Struct Recursive Indexer
% Sayid A. Munthahar (sayidachmadm@gmail.com)
% Example usage
% Struct "Student" with personal info and nested structs for address, grades, and hobbies

% Level 1: Main Struct
student.name = 'John Doe';
student.age = 22;

% Level 2: Address (nested struct)
student.address.street = '123 Scania street';
student.address.city = 'Sodertalje';
student.address.zip = '01101';

% Level 2: Grades (nested struct)
student.grades.math = 90;
student.grades.science = 85;
student.grades.history = 88;

% Level 3: Hobbies (nested struct inside another struct)
student.hobbies.sports.type = 'Basketball';
student.hobbies.sports.level = 'Intermediate';
student.hobbies.reading.favoriteBook = '1984';
student.hobbies.reading.genre = 'Dystopian';

% Display the complete struct
disp('Student Struct:');
disp(student);


recursive_search(student,0,"main","0")

%%
function recursive_search(struct_var,num_level,origin,origin_idx)
% Struct recursive indexer
% Sayid A. Munthahar (sayidachmadm@gmail.com)

num_level=num_level+1;
origin=append(origin);
origin_idx=append(origin_idx);
fieldnames_str=string(fieldnames(struct_var));
nonstruct_idx={};
struct_idx={};
for i=1:1:length(fieldnames_str)
    if ~isa(struct_var.(fieldnames_str(i)),'struct')
        nonstruct_idx{end+1}=i;
    else
        struct_idx{end+1}=i;
    end
end
fprintf("Current directory (level %d): %s \n",num_level,origin);
% disp("--------")

if ~isempty(struct_idx)
    fprintf(">>>structs index: \n")
    for i=1:1:length(struct_idx)
        fprintf("%s-->[%d] %s \n",origin_idx,struct_idx{i},fieldnames_str(struct_idx{i}))
    end
end
if ~isempty(nonstruct_idx) 
    fprintf(">>>nonstruct index: \n")
    for i=1:1:length(nonstruct_idx)
        fprintf("%s-->[%d] %s \n",origin_idx,nonstruct_idx{i},fieldnames_str(nonstruct_idx{i}))
    end
end
for i=1:1:length(struct_idx)
    disp("----------%%%%%----------")
    recursive_search(struct_var.(fieldnames_str(struct_idx{i})),num_level,append(origin,"-->",fieldnames_str(struct_idx{i})),append(origin_idx,"-->",string(struct_idx{i})))
end
end

