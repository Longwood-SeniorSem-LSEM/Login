function validateFileUpload() {
    var filename = document.forms["UploadForm"]["file"].value;
    var due_date = document.forms["UploadForm"]["due_date"].value;
    var assign_date = document.forms["UploadForm"]["assign_date"].value;
    if (filename == null || filename == "") {
        alert("Filename must be filled out.");
    } else if (due_date == null || due_date == "") {
        alert("Due date must be filled out.");
    } else if (assign_date == null || assign_date == "") {
        alert("Assign date must be filled out.");
    } else if (assign_date > due_date) {
        alert("Assign date is after due date!");
    } else {
        return true;
    }
    return false;
}
