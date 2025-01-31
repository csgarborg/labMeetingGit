% SPENCER'S STARTUP FILE

addpath(genpath('C:\Workspace\Code'));

FolderInfo = dir('C:\Workspace\Code');

if length(FolderInfo) > 2
    for n = 3:length(FolderInfo)
        if any(strcmp(FolderInfo(n).name, {'LWRCT','HCM','eLife MATLAB','gitTest1'}))
            continue
        end
        disp([10 '--------------------------------------------------------' 10 'Updating ' FolderInfo(n).name 10 '--------------------------------------------------------' 10]);
        cd(['C:\Workspace\Code\' FolderInfo(n).name '\']);
        CommitStatus = system('git diff --quiet');
        if CommitStatus == 0
            !git fetch
            MergeStatus = system('git merge');
            if MergeStatus ~= 0
                !git merge --abort
                disp('Conflict merging, could not update local repository');
            end
        else
            disp('Uncommitted changes in local repository, could not update');
        end
    end
end

cd 'C:\Workspace\Code\'

dbstop if error

