const mysql = require('mysql');

const connection = mysql.createConnection({
	host:'localhost',
	user : 'root',
	password : '',
	database : 'mysql-example'
});

connection.connect( error => {
	if ( error ) {
		console.log('connect error : ', error);
		return;
	}
	console.log('connection success');

	//writeFeed('iu', '아이유가 쓴 글1');
	//writeFeed('iu', '아이유가 쓴 글2');
	//
	//writeFeed('inna', '유인나가 쓴 글1');
	//writeFeed('inna', '유인나가 쓴 글2');
	//writeFeed('inna', '유인나가 쓴 글3');
	//
	//writeFeed('suji', '수지가 쓴 글1');
	//
	//writeFeed('sulhyun', '설현이 쓴 글1');
	//writeFeed('sulhyun', '설현이 쓴 글2');

	// IU가 Inna 친구
	//makeFriends('iu', 'inna');
	// Suji가 IU 친구
	//makeFriends('suji', 'iu');
	//makeFriends('iu', 'suji');

	// IU의 피드 보기
	console.log('== IU의 타임라인 ==')
	showTimeline('iu');

	connection.end();
});

function showTimeline(user) {
	const query =
		`select * from feeds where user=?
		union
		select * from feeds where user in (
			select friend from friendship where user=?
			union
			select user from friendship where friend=?)`;

	connection.query(query, [user, user, user], (error, results) => {
		if ( error ) {
			console.error('Show feed Error : ', error);
			return;
		}

		for(var item of results) {
			console.log(`${item.user} : ${item.message}`);
		}
	});
}

function writeFeed(user, message) {
	const query = 'insert into feeds set ?';
	connection.query(query, {user:user, message:message}, (error, result) => {
		if ( error ) {
			console.error('Writing Feed error : ', error);
			return;
		}
		console.log('Writing Feed Success');
	});
}


function makeFriends(user, friend) {
	const query = 'insert into friendship set ?';
	connection.query(query, {user:user, friend:friend}, (error, result) => {
		if ( error ) {
			console.log('Making Friends Error : ', error);
			return;
		}
		console.log(`${user}는 ${friend}와 친구가 됨`);
	});
}



