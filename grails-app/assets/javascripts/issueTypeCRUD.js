
function refreshPage() {
    document.location = document.location.pathname;
};

/**
 * Create a issue type.
 */
function createIssueType() {
    var issueTypeTopic = document.getElementById('form-issue-topic').value;

    if (!formDataHelper.validString(issueTypeTopic)) {
        sweetAlert('You must type a correct name for the issue', null, 'error');
        return;
    }

    swal({
        title: 'Create this issue type?',
        text: 'The issue type ' + issueTypeTopic + ' will be created.',
        type: 'info',
        showCancelButton: true,
        closeOnConfirm: false,
        showLoaderOnConfirm: true
    }, function() {
        $.ajax({
            url: "/issueType/createIssueType",
            method: "POST",
            data: { "topic": issueTypeTopic },
            dataType: "json",
            success: function(data) {
                swal({
                    title: 'The issue type was created!',
                    type: 'success',
                    showLoaderOnConfirm: true
                }, function() {
                    refreshPage();
                });
            },
            error: function(err) {
                sweetAlert('Error creating the issue type', err, 'error');
            }
        });
    });
};


/**
 * Create a issue type.
 */
function modifyIssueType() {
    var issueTypeTopic = document.getElementById('form-issue-topic-modify').value;
    var newIssueTypeTopic = document.getElementById('form-issue-new-topic').value;

    if (!formDataHelper.validString(newIssueTypeTopic)) {
        sweetAlert('You must type a correct name for the issue', null, 'error');
        return;
    }

    swal({
        title: 'Modify this issue type ' + issueTypeTopic + '?',
        text: 'The issue type ' + issueTypeTopic + ' will be modified to ' + newIssueTypeTopic + '.',
        type: 'info',
        showCancelButton: true,
        closeOnConfirm: false,
        showLoaderOnConfirm: true
    }, function() {
        $.ajax({
            url: "/issueType/modifyIssueType",
            method: "POST",
            data: {
                "topic": issueTypeTopic,
                "newTopic": newIssueTypeTopic
            },
            dataType: "json",
            success: function(data) {
                swal({
                    title: 'The issue type was modified!',
                    type: 'success',
                    showLoaderOnConfirm: true
                }, function() {
                    refreshPage();
                });
            },
            error: function(err) {
                sweetAlert('Error modifing the issue type', err, 'error');
            }
        });
    });
};

/**
 * Remove a issue type.
 */
function removeIssueType(issueTypeId, issueTypeTopic) {

    swal({
        title: 'Delete this issue type?',
        text: 'The issue type "' + issueTypeTopic + '" will be deleted.',
        type: 'info',
        showCancelButton: true,
        closeOnConfirm: false,
        showLoaderOnConfirm: true
    }, function() {
        $.ajax({
            url: "/issueType/deleteIssueType",
            method: "POST",
            data: { "id": issueTypeId },
            dataType: "json",
            success: function(data) {
                if (!data.success) {
                    sweetAlert('The issue type could not be deleted', data.error, 'error');
                    return;
                }
                swal({
                    title: 'The issue type was deleted!',
                    type: 'success',
                    showLoaderOnConfirm: true
                }, function() {
                    refreshPage();
                });

            },
            error: function(err) {
                sweetAlert('Error deleting the issue type', err, 'error');
            }
        });
    });
};

function showCreateIssueTypeModal() {
    $('#createIssueTypeModal').modal('show');
};

function showModifyIssueModal(topicName) {
    var modalId = 'modifyIssueTypeModal';
    var modal = $('#' + modalId);
    var modalDiv = document.getElementById('modifyIssueTypeModal');

    modalDiv.innerHTML = '<div class="col-md-6"> \
                            <div class="modal-dialog"> \
                                <div class="modal-header"> \
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button> \
                                    <h3 class="modal-title left">Modify an Issue Type</h3> \
                                </div> \
                                <div class="modal-body"> \
                                    <div class="row"> \
                                        <div class="col-md-12"> \
                                            <h4>Topic</h4> \
                                            <input id="form-issue-topic-modify" type="hidden" value="' + topicName + '"> \
                                            <input id="form-issue-new-topic" type="text" class="form-control" placeholder="New Issue type topic" value="' + topicName + '" /> \
                                        </div> \
                                    </div> \
                                </div> \
                                <div class="modal-footer"> \
                                    <button onclick="modifyIssueType()" type="button" class="btn btn-primary">Create</button> \
                                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button> \
                                </div> \
                            </div> \
                        </div>';

    modal.modal('show');
}
