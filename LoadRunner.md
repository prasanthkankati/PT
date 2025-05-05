Load runner componants:
VUgen - for script design
Controller - for test execution
Analysis- to generate test relports and view results
![image](https://github.com/user-attachments/assets/eadcfd9d-4510-419e-90bc-f7d91c99751a)

Start page > Script page > + button to create new script then it will show the protocalls to select window in the same page you will be seeing single protocall,
multiple protocall, mobile protocalls aswell > defaultly the scripts will be saved in the admin/ scrips folder.
we can name the script in the same window.

![image](https://github.com/user-attachments/assets/7c720572-c155-43a2-ab76-27a50163f58f)

defaultly the scripting will be done in Actions.
there are three types in Actions
1. Vuser_init - its like an annatation before the test gets start and we can not iterate it just execute once before actions.
2. Action - Actual script stays here.
3. Vuser_end - its like an annatation after the test gets/script executed and we can not iterate it just executes once after actions.
File
UI Navigation: ![image](https://github.com/user-attachments/assets/cb032135-bcf9-4ded-8772-99c1df4d07e8)
Edit:
![image](https://github.com/user-attachments/assets/63db6d11-484c-4fdb-adbb-f9c46891b13e)
![image](https://github.com/user-attachments/assets/09b088b1-0eb3-4da6-baeb-acfaedc30efd)
view:
![image](https://github.com/user-attachments/assets/9c308657-2d0c-4e1c-9ee6-c3d77465d49e)
search:
![image](https://github.com/user-attachments/assets/5f6946c1-59ea-40f1-a7af-499595ef91ab)
design:
![image](https://github.com/user-attachments/assets/a6faf807-9feb-4f8a-badc-7b18d12c90a7)
![image](https://github.com/user-attachments/assets/3ad2f4b8-6e85-407c-a100-7753271509e1)
record: ![image](https://github.com/user-attachments/assets/baaf9aa1-59c1-4336-8e79-f40d380bb001)
Replay:
![image](https://github.com/user-attachments/assets/6e6d7f6e-af85-4c01-9dc0-97e3e243ce29)
again in script window 
![image](https://github.com/user-attachments/assets/074ee2cf-a524-4cef-9e7e-36ca671e61bb)
Record control+R or reddot
![image](https://github.com/user-attachments/assets/026a884a-667a-4eb9-b934-4b3a81d5c48c)


VU gen captures the interaction between the client and server and generate script in C+ or JS. we can execute the script with vugen but only for debugging perspective.
we can playback the scripts.

what is a dry run or sample test:

befor the actual execution we will check the test reliability. also calls as mock/shakedown test usually performs with very less load with less time.

