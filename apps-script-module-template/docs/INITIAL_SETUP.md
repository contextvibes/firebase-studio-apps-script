# Initial Project Setup: Authenticating and Cloning

Follow these one-time steps in your Project IDX terminal to authenticate your Google account and link this local workspace to your Google Apps Script project.

## Step 1: Log into Google (`clasp login`)

Because you are in a cloud development environment, you must use the `--no-localhost` flag to log in correctly.

1.  **Run the Login Command:**
    In the terminal, execute the following command:
    ```bash
    clasp login --no-localhost
    ```

2.  **Authorize in Your Browser:**
    *   The command will print a long URL. **Copy this entire URL**.
    *   Paste the URL into your local web browser and press Enter.
    *   Follow the prompts to choose your Google Account and grant `clasp` the necessary permissions.

3.  **Complete the Authentication:**
    *   After you grant permissions, your browser will be redirected to a page that shows an error like "This site can’t be reached." **This is expected and normal.**
    *   **Copy the full URL** from your browser's address bar. It will look something like `http://localhost:8888/?code=4/0A...`.
    *   **Paste this final URL** back into the terminal where `clasp` is prompting you for it, and press Enter.

    You should see a success message: `You are logged in as your-email@gmail.com.`

## Step 2: Clone Your Script into the `src` Directory

Now, you will pull the code from your existing Apps Script project into the correct `src` folder in this workspace.

1.  **Find Your Script ID:**
    Go to [script.google.com](https://script.google.com) and open your project. The Script ID is the long string of characters in the URL:
    `https://script.google.com/d/THIS_IS_YOUR_SCRIPT_ID/edit`

2.  **Run the Clone Command:**
    Use the following command, replacing `"YOUR_SCRIPT_ID_HERE"` with the ID you just copied. The `--rootDir src` flag is critical as it places the files correctly.

    ```bash
    clasp clone "YOUR_SCRIPT_ID_HERE" --rootDir src
    ```

    You will see output confirming the files were cloned:
    ```    └─ src/appsscript.json
    └─ src/Code.js
    Cloned 2 files.
    ```

**Setup is complete!** You are now ready to start developing. You can edit the files in the `src` directory locally and use `clasp push` to upload your changes to Google Apps Script.
