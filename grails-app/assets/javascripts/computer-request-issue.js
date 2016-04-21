
/**
 * Shared data for computer ip address and name, and form data at
 * the submition.
 */
var sendData = {};

/**
 * Gets the computer name from IP address, returning in a JSON.
 */
var getComputerNameByIpAddress = function (ipAddress) {
    var name = '';
    $.ajax({
        url: "/computer/getComputerNameByIpAddress/",
        data: { ipAddress: ipAddress },
        method: "POST",
        dataType: "json",
        async: false,
        success: function(data) {
            name = data.name;
        }
    });
    return name;
};

var loadIssueTypeSelect = function(selId) {
    var req = $.ajax({
        url: "/notifyIssue/getAllIssueTypes",
        method: "POST",
        dataType: "json"
    });

    req.done(function(data) {
        var issueTypeSelect = $('#' + selId);
        var size = data.length;

        for (var i = 0; i < size; i++) {
            var issue = data[i];

            issueTypeSelect
                 .append($("<option></option>")
                    .attr("value", issue.id)
                    .text(issue.topic));
        }
    });
};

var processInstallRequestForm = function() {

    return false; // Prevent GET submit
};

var installRequest = function(computerIpAddress) {
    var modalId = 'installRequestModal';
    var modal = $('#' + modalId);
    var computerName = getComputerNameByIpAddress(computerIpAddress);

    document.getElementById(modalId).innerHTML = '<div class="modal-dialog"> \
            <div class="modal-header"> \
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"> \
                    <span aria-hidden="true">×</span> \
                </button> \
                <h4 class="modal-title">Install Request for computer ' + computerName + '</h4> \
            </div> \
            <form onsubmit="return processInstallRequestForm()" action="" method="POST"> \
                <div class="modal-body"> \
                    <div class="row"> \
                        <div class="col-md-12"> \
                            <h4>Subject:</h4> \
                            <input type="text" class="form-control" placeholder="Subject" /> \
                        </div> \
                    </div> \
                    <div class="row"> \
                        <div class="col-md-12"> \
                            <h4>Install request description:</h4> \
                            <textarea placeholder="Description" class="form-control"></textarea> \
                        </div> \
                    </div> \
                    <div class="row"> \
                        <div class="col-md-4"> \
                            <h4>Requested Software:</h4> \
                            <textarea  placeholder="Software request" class="form-control"></textarea> \
                        </div> \
                        <div class="col-md-8"> \
                            <div class="row"> \
                                <div class="col-md-4"> \
                                    <h5>Min. RAM</h5> \
                                    <input type="number" class="form-control" /> \
                                </div> \
                                <div class="col-md-4"> \
                                    <h5>Min. Storage</h5> \
                                    <input type="number" class="form-control" /> \
                                </div> \
                                <div class="col-md-4"> \
                                    <h5>File system</h5> \
                                    <select class="form-control"> \
                                        <option>NTFS</option> \
                                        <option>NTFS</option> \
                                    </select> \
                                </div> \
                            </div> \
                            <div class="row"> \
                                <div class="col-md-4"> \
                                    <h5>Operating System</h5> \
                                    <select class="form-control"> \
                                        <option>Windows</option> \
                                        <option>Linux</option> \
                                    </select> \
                                </div> \
                                <div class="col-md-8"> \
                                    <h5>Software dependencies</h5> \
                                    <select class="form-control" multiple> \
                                        <option>JRE</option> \
                                        <option>Nodejs</option> \
                                    </select> \
                                </div> \
                            </div> \
                        </div> \
                    </div> \
                </div> \
                <div class="modal-footer"> \
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button> \
                    <button type="submit" class="btn btn-success">Send Install Request</button> \
                </div> \
            </form> \
        </div>';
    modal.modal('show');

    sendData.computer = {
        "ipAddress": computerIpAddress,
        "name": computerName
    };
};

var notifyIssueError = function(errorMsg) {
    var msg = formDataHelper.validString(errorMsg) ? errorMsg : 'The requested notify issue can not been sended';
    sweetAlert('Error notifying the issue', msg, 'error');
};

/**
 *
 */
var processNotifyIsueForm = function() {

    var subject     = document.getElementById('form-issue-subject');
    var topic       = document.getElementById('form-select-issue-type');
    var description = document.getElementById('form-issue-description');
    var remarks     = document.getElementById('form-issue-remarks');

    if (!formDataHelper.validString(subject.value) ||
            !topic.options[topic.selectedIndex].value ||
                !formDataHelper.validString(description.value) ||
                    !formDataHelper.validString(remarks.value)
    ) {
        notifyIssueError('You need to fill all the data!');
        return false;
    }

    sendData.issue = {
        "subject": subject.value,
        "topic": topic.options[topic.selectedIndex].value,
        "description": description.value,
        "remarks": remarks.value
    };

    swal({
        title: 'Are you sure to send this issue notification?',
        text: 'Issue notification',
        type: 'info',
        showCancelButton: true,
        closeOnConfirm: false,
        showLoaderOnConfirm: true
    }, function() {

        var req = $.ajax({
            url: "/notifyIssue/notifyIssue",
            data: { "issue": sendData.issue, "computer": sendData.computer },
            method: "POST",
            dataType: "json"
        });
        req.done(function(data) {
            if (!data.success) {
                notifyIssueError(data.flashError);
                return;
            }
            sweetAlert('Notify issue sended', 'The requested notify issue has been sended', 'success');
            $('.modal').modal('hide');
        });
        req.fail(function(err) {
            notifyIssueError(err);
        });

    });

    return false; // Prevent GET submit
};

var notifyIssue = function(computerIpAddress) {
    var modalId = 'notifyIssueModal';
    var modal = $('#' + modalId);
    var computerName = getComputerNameByIpAddress(computerIpAddress);

    document.getElementById(modalId).innerHTML = '<div class="modal-dialog"> \
        <div class="modal-header"> \
            <button type="button" class="close" data-dismiss="modal" aria-label="Close"> \
                <span aria-hidden="true">×</span> \
            </button> \
            <h4 class="modal-title">Notify Issue for computer ' + computerName + '</h4> \
        </div> \
        <form onsubmit="return processNotifyIsueForm()" action="" method="POST"> \
            <div class="modal-body"> \
                <div class="row"> \
                    <div class="col-md-12"> \
                        <h4>Subject:</h4> \
                        <input id="form-issue-subject" type="text" class="form-control" placeholder="Subject" /> \
                    </div> \
                </div> \
                <div class="row"> \
                    <div class="col-md-12"> \
                        <h4>Issue related with:</h4> \
                        <select id="form-select-issue-type" class="form-control"> \
                            <option value="">Choose the related issue</option> \
                        </select> \
                    </div> \
                </div> \
                <div class="row"> \
                    <div class="col-md-12"> \
                        <h4>Issue description:</h4> \
                        <textarea id="form-issue-description" placeholder="Description" class="form-control"></textarea> \
                    </div> \
                </div> \
                <div class="row"> \
                    <div class="col-md-12"> \
                        <h4>Remarks:</h4> \
                        <textarea id="form-issue-remarks" placeholder="Remarks" class="form-control"></textarea> \
                    </div> \
                </div> \
            </div> \
            <div class="modal-footer"> \
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button> \
                <button type="submit" class="btn btn-warning">Send Issue</button> \
            </div> \
        </form> \
    </div>';
    modal.modal('show');

    // Load data to form controllers
    loadIssueTypeSelect('form-select-issue-type');

    sendData.computer = {
        "ipAddress": computerIpAddress,
        "name": computerName
    };
};
