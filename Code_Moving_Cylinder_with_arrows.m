

clc
clear all;
% set up the code for communicating with Unity
tcpipClient = tcpip('127.0.0.1',55001,'NetworkRole','Client');
set(tcpipClient,'Timeout',3);
% set up the Key for lef-right
escapeKey = KbName('ESCAPE');
leftKey = KbName('LeftArrow');
rightKey = KbName('RightArrow');
downKey = KbName('DownArrow');
upKey = KbName('UpArrow');


% set a flag to close the while loop
flag = 0;
% initiate the while loop to control the cylinder via matlab
while flag == 0
    % check whichc key is down. The ocmputer deosen't recognize external
    % keyboard, use the laptop keyboard.
    [~,~, keyCode] = KbCheck();
    
    %% if you press only one key, run this code
    % the "or" is because otherwise it has to recognize that when you don'
    % press the key, the value iz 0 (no movement).
    if sum(keyCode) == 1 || sum(keyCode) == 0
        % if is the left key, set the move to value
        if keyCode(leftKey)
            move = '1';
            % open the port for the client
            fopen(tcpipClient);
            % pass the matrix "move" into the client (unity)
            fwrite(tcpipClient,move);
            % close the client
            fclose(tcpipClient);
            % set the key code at 0 t the end of the elseif so that the
            % cylinder stop to move when you release the key
            keyCode = 0;
            % if is the left key, set the move to value -1
        elseif keyCode(rightKey)
            move = '-1';
            % open the port for the client
            fopen(tcpipClient);
            % pass the matrix "move" into the client (unity)
            fwrite(tcpipClient,move);
            % close the client
            fclose(tcpipClient);
            % set the key code at 0 t the end of the elseif so that the
            % cylinder stop to move when you release the key
            keyCode = 0;
            % if you stop pressing the key, the cylinder stops to move
        elseif keyCode(upKey)
            move = '2';
            % open the port for the client
            fopen(tcpipClient);
            % pass the matrix "move" into the client (unity)
            fwrite(tcpipClient,move);
            % close the client
            fclose(tcpipClient);
            % set the key code at 0 t the end of the elseif so that the
            % cylinder stop to move when you release the key
            keyCode = 0;
            % if you stop pressing the key, the cylinder stops to move
        elseif keyCode(downKey)
            move = '-2';
            % open the port for the client
            fopen(tcpipClient);
            % pass the matrix "move" into the client (unity)
            fwrite(tcpipClient,move);
            % close the client
            fclose(tcpipClient);
            % set the key code at 0 t the end of the elseif so that the
            % cylinder stop to move when you release the key
            keyCode = 0;
            % if you stop pressing the key, the cylinder stops to move
        elseif keyCode == 0
            move = '0';
            fopen(tcpipClient);
            fwrite(tcpipClient,move);
            fclose(tcpipClient);
            % rpess the ESC key to stop the while loop
        elseif keyCode(escapeKey)
            flag = 1;
            fclose(tcpipClient);
        end
    end
        %% if you press two keys, then you have to set the combination of the vertical and horizontal
        % movements. A different number is assigned, otherwise the code in C# can't run if the same value
        % is specified.
        if sum(keyCode) == 2
            if keyCode(downKey) && keyCode(leftKey)
                move = '3';
                % open the port for the client
                fopen(tcpipClient);
                % pass the matrix "move" into the client (unity)
                fwrite(tcpipClient,move);
                % close the client
                fclose(tcpipClient);
                % set the key code at 0 t the end of the elseif so that the
                % cylinder stop to move when you release the key
                keyCode = 0;
                % if you stop pressing the key, the cylinder stops to move
            elseif keyCode(downKey) && keyCode(rightKey)
                move = '-3';
                % open the port for the client
                fopen(tcpipClient);
                % pass the matrix "move" into the client (unity)
                fwrite(tcpipClient,move);
                % close the client
                fclose(tcpipClient);
                % set the key code at 0 t the end of the elseif so that the
                % cylinder stop to move when you release the key
                keyCode = 0;
                % if you stop pressing the key, the cylinder stops to move
            elseif keyCode(upKey) && keyCode(leftKey)
                move = '4';
                % open the port for the client
                fopen(tcpipClient);
                % pass the matrix "move" into the client (unity)
                fwrite(tcpipClient,move);
                % close the client
                fclose(tcpipClient);
                % set the key code at 0 t the end of the elseif so that the
                % cylinder stop to move when you release the key
                keyCode = 0;
                % if you stop pressing the key, the cylinder stops to move
            elseif keyCode(upKey) && keyCode(rightKey)
                move = '-4';
                % open the port for the client
                fopen(tcpipClient);
                % pass the matrix "move" into the client (unity)
                fwrite(tcpipClient,move);
                % close the client
                fclose(tcpipClient);
                % set the key code at 0 t the end of the elseif so that the
                % cylinder stop to move when you release the key
                keyCode = 0;
                % if you stop pressing the key, the cylinder stops to move
                %%
            elseif keyCode == 0
                move = '0';
                fopen(tcpipClient);
                fwrite(tcpipClient,move);
                fclose(tcpipClient);
                % rpess the ESC key to stop the while loop
            elseif keyCode(escapeKey)
                flag = 1;
                fclose(tcpipClient);
            end
        end
    
end
