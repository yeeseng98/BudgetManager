use intdatabase;

create table testTable (
	id VARCHAR(255) PRIMARY KEY,
    stdName VARCHAR(255),
    stdEmail VARCHAR(255)
    );

create table FormTable (
	formID VARCHAR(255) NOT NULL,
	formName VARCHAR(255) NOT NULL,
    PRIMARY KEY (formID),
    dateCreated date
);

update formtable set datecreated = '2019-08-10';
create table FormFormat (
	formID VARCHAR(255),
	FOREIGN KEY formID (formID) REFERENCES FormTable(formID),
    formatID VARCHAR(255),
    PRIMARY KEY(formatID),
	name VARCHAR(255),
    type VARCHAR(255),
    required VARCHAR(255),
    display VARCHAR(255),
    selected VARCHAR(255),
    title VARCHAR(255)
);

create table optionsTable (
	fieldID VARCHAR(255),
	FOREIGN KEY (fieldID)	REFERENCES FormFormat(formatID),
	`key` VARCHAR(255),
    label VARCHAR(255)
);

create table FormFieldSubmission (
	fieldID VARCHAR(255),
    FOREIGN KEY(fieldID) REFERENCES FormFormat(formatID),
    studentID VARCHAR(255),
    FOREIGN KEY(studentID) REFERENCES TestTable(id),
    value VARCHAR(255)
);
select * from workflow;
select * from workflowphase;
select * from workflowphasetasks;
select * from formtable;
select * from formformat;
select * from formfieldsubmission;
show processlist;
delete from workflow;
delete from workflowphase;
delete from workflowphasetasks;

create table fileTable (
	id int NOT NULL AUTO_INCREMENT,
	fileName VARCHAR(255),
	content mediumblob,
	PRIMARY KEY (id)
);

create table Workflow (
	workflowID VARCHAR(255),
    PRIMARY KEY (workflowID),
    workflowName VARCHAR(255),
    dateCreated date
);

create table WorkflowPhase (
	workflowID VARCHAR(255),
	FOREIGN KEY workflowID (workflowID) REFERENCES Workflow(workflowID),
	phaseID VARCHAR(255),
    PRIMARY KEY (phaseID),
    phaseOrder VARCHAR(255),
    phaseName VARCHAR(255)
);

select * from workflowPhase;

create table WorkflowPhaseTasks (
	phaseID VARCHAR(255),
	FOREIGN KEY phaseID (phaseID) REFERENCES WorkflowPhase(phaseID),
	taskID VARCHAR(255),
    PRIMARY KEY (taskID),
    taskName VARCHAR(255),
	taskType VARCHAR(255),
    formID VARCHAR(255),
	FOREIGN KEY formID (formID) REFERENCES FormTable(formID)
);

create table Intake_Workflow (
	intakeCode VARCHAR(255),
    PRIMARY KEY (intakeCode),
    workflowId VARCHAR(255),
    FOREIGN KEY workflowId (workflowId) REFERENCES Workflow(workflowId),
    startDate VARCHAR(255),
    endDate VARCHAR(255)
);

DROP TABLE Intake_workflow
select * from Workflow w inner join workflowphase p on w.workflowID = p.workflowID INNER JOIN workflowphasetasks t on p.phaseID = t.phaseID where p.workflowID = 'work1' order by p.phaseOrder;
select * from Workflow w inner join workflowphase p on w.workflowID = p.workflowID WHERE p.workflowID = 'work1' order by p.phaseOrder