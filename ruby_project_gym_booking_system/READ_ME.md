<b>The Simple Gym Booking System was developed and tested on mac.</b>
<br />
<br />
<h1>Technology Required</h1>
<p>
    Before using the app, the following technologies are required:
</p>
<p>
    <ul>
        <li>Ruby</li>
        <li>PostgreSQL</li>
        <li>Gems:
            <ul>
                <li>pg</li>
                <li>sinatra</li>
                <li>sinatra contrib</li>
            </ul>
        </li>
    </ul>
</p>

<h1>Initial Setup</h1>
<p>
    <ol>
        <li>Download the program files from github</li>
        <li>
            Move files from your download folder into a sensible place on your computer 
        </li>
        <li>Open up a termal window</li>
        <li>
            Type <code>createdb gym_project</code> in the terminal to create you database
        </li>
        <li>
            Next, use the command <code>cd your_file_path/ruby_project_gym_booking_system/db</code> to access the db (database) folder
        </li>
        <li>
            Once your are in the db folder, type <code>psql -d gym_project -f gym.sql</code> to set-up the table for you database
        </li>
        <li>
            <i>(optional step)</i> If you want to see the database (put intial data into the database), type <code>ruby seeds.rb</code> into the termal
        </li>
    </ol>
</p>
<p>The Simple Gym Booking System app is now ready to use</p>
<br />
<h1>Running the app</h1>
<p>
    <ol>
        <li>Open up a termal window</li>
        <li>
            Type <code>cd your_file_path/ruby_project_gym_booking_system</code> to navigate to the system's main folder
        </li>
        <li>
            Next, type <code>ruby app.rb</code> to start up sinatra 
        </li>
        <li>
            <code>Sinatra (v2.0.8.1) has taken the stage on 4567</code>
            Should now be one of the lines on your terminal. <code>(v2.0.8.1)</code> is the version of sinatra you are using (yours may differ). <code>4567</code> is the port sinatra is running on (yours may differ).
        </li>
        <li>
            Open up a web browser and type <code>localhost:(your port number)</code> to go to the home page of the app.
        </li>
    </ol>
</p>

<br />

<h1>Ruby Project Brief</h1>

<h2>Gym</h2>
<p>
    A local gym has asked you to build a piece of software to help them to manage memberships, and register members for classes.
</p>

<h2>MVP</h2>
<ul>
    <li>The app should allow the gym to create / edit / delete members</li>
    <li>The app should allow the gym to create / edit / delete classes</li>
    <li>The app should allow the gym to add members to specific classes</li>
    <li>The app should show a list of all upcoming classes</li>
    <li>The app should show all members that are registered for a particular class</li>
</ul>