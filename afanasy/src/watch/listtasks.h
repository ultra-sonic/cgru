#pragma once

#include "../libafanasy/msg.h"
#include "../libafanasy/msgclasses/mcgeneral.h"
#include "../libafanasy/name_af.h"

#include "../libafqt/name_afqt.h"

#include "listitems.h"

class QListWidget;
class QListWidgetItem;

class ItemJobBlock;
class ItemJobTask;

class ListTasks : public ListItems
{
	Q_OBJECT

public:
	ListTasks( QWidget* parent, int JobId, const QString & JobName);
	~ListTasks();

	bool caseMessage( af::Msg * msg);

	bool mousePressed( QMouseEvent * event);

	void sortBlock( int numblock);

	bool v_filesReceived( const af::MCTaskUp & i_taskup );

signals:
	void changeMonitor( int type, int id);

protected:
	void contextMenuEvent(QContextMenuEvent *event);
	void doubleClicked( Item * item);
	void v_connectionLost();

private slots:

	void actBlockCommand();
	void actBlockWorkingDir();
	void actBlockFiles();
	void actBlockCmdPost();
	void actBlockService();
	void actBlockParser();

	void blockAction( int id_block, QString i_action);

	void actTaskInfo();
	void actTaskLog();
	void actTaskStdOut( int number );
	void actTaskErrorHosts();
	void actTaskPreview( int num_cmd, int num_img);
	void actTaskListen();
	void actTasksRestart();
	void actTasksSkip();

	void actBrowseFolder();

private:
	int m_job_id;
	QString m_job_name;

	int m_blocks_num;
	ItemJobBlock ** m_blocks;
	int * m_tasks_num;
	ItemJobTask *** m_tasks;

	bool constructed;

private:
	void construct( af::Job * job);

	bool updateProgress( const af::JobProgress * progress);
	bool updateTasks( af::MCTasksProgress * mctasksprogress);

	int getRow( int block, int task = -1);

	void blockAction( int id_block, const QString & i_action, bool i_query);
	void tasksOpeation( const std::string & i_type);
	void do_Info_StdOut(   int type, int number, Item * item = NULL);
	void setWindowTitleProgress();
};
