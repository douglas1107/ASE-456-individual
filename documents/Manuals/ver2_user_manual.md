# **User Manual for Time Management App Ver 2)**

## **Overview**
The Time Management App allows users to log their time usage and query their records efficiently. Version 2 includes enhanced features such as generating priority lists based on task durations and querying logs within a date range.

---

## **New Features in Version 2**
1. **Task Priority List**
    - View tasks sorted by the amount of time spent on each.
    - Helps users identify their most time-consuming activities.

2. **Enhanced Querying**
    - Query logs within a specific date range.
    - Search by `DATE`, `TASK`, or `TAG`.

3. **Improved Usability**
    - Enhanced form validation to prevent invalid inputs.
    - Error handling for network issues during Firebase operations.

---

## **How to Use**

### **Logging Activities**
1. **Step 1:** Open the app and select the **Log Time** button on the home page.
2. **Step 2:** Fill out the following fields:
    - **`DATE`**: Use the format `YYYY-MM-DD`.
    - **`FROM`**: Use the format `HH:MM AM/PM`.
    - **`TO`**: Use the format `HH:MM AM/PM`.
    - **`TASK`**: Describe the activity (e.g., "Studied Math").
    - **`TAG`**: Add a tag for categorization (e.g., "Study").
3. **Step 3:** Press **Submit** to save the log. A success message will confirm the entry.

---

### **Querying Logs**
1. **Step 1:** Open the app and select the **Query Logs** button on the home page.
2. **Step 2:** Enter search criteria:
    - **`Start Date`**: Specify the start of the date range.
    - **`End Date`**: Specify the end of the date range.
3. **Step 3:** Press **Fetch Logs Between Dates**. Logs matching the criteria will be displayed.
4. **Step 4 (Optional):** Search logs by `TASK` or `TAG` to filter results further.

---

### **Viewing Priority Logs**
1. **Step 1:** In the **Query Logs** section, click the **Fetch Priority Logs** button.
2. **Step 2:** View a sorted list of tasks based on the time spent (highest to lowest).
3. **Step 3:** Use this information to prioritize your activities.

