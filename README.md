# PsychStation

A Flutter project.

Psych Station is a mobile application for mental health professionals created by psychiatrists. Its purpose is to provide a highly accessible, centralized clinical information resource curated specifically for mental health professional practice.

--------------------------------------------------------------------------------------------

User Interface:

The application is divided into three major tabs: Tools, Patients, Account

Tools Tab: 
This is the Home Screen / landing page displayed when the application is opened. A list of the different tools available to use in this section are displayed in a menu on this page. These include:
Calculators
Scales
Clinical Guides
Landmark Studies
Local Resources
Medications
DSM Guide
Primary Care for Psychiatrists

Pateints Tab:
This is a password protected section where mental health professionals can add a list of patients (only identified by a three character ID, no other patient identifying information is stored) Providers are able to save and access results of clinical scales that belong to a patient added by that user. Patients cannot be deleted but rather are archived to comply with hipaa. All changes to patient data is output to a non-editable log that indicates when and who changed the data as well as if the data was sent anywhere. Patient data created by one user is not visible to any other user, with the exception of authorzied administrative purposes.

Account Tab:
The user is able to see and manage any settings or user information held by the application. 

--------------------------------------------------------------------------------------------

Notes About Application File/Code Architecture:

The main dart file points to the Tools_screen, file located in /lib/Tools as its landing page. This screen displays the list of Tool_item widgets, file also located in /lib/Tools. Navigation in the application is handled by named routes defined in the routes table in the main.dart file. Each Tool Item navigates to a unique list_screen for that tool. Each tool's list_screen or equivalent is located in the its respective folder located in the /lib/Tools folder. Whithin that /lib/Tools/(tool item) folder there may be subfolders organizing specific groups of files that pertain to the available items included in that tool. For example, within the /lib/Tools/Scales folder, there are subfolders that contain documents related to the function and display of the available clinical scales in the scales tool, such as: PHQ9, GAD7, AIMS, etc. 

However, models of data that relate to all sections of the application broadly are located in the lib/models folder. Model files are not found within corresponding /lib/Tools/(tool item) folders or elsewhere in the application.

The assets folder contains fonts information used in the application theme set in the main.dart file. The assets also contains folders for various tools in the application where infographics images are used as the predominant content delivery method, as apposed to formatted and themed text rendered by the application. These infographic images are shipped with the application and not stored on a remote server, to enable offline use and improved application performance.

# PsychStation
