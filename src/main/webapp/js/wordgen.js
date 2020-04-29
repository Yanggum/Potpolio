wordlist = [];
gName = null;
gCnt = 0;
badWordList = [];
class Word{
    constructor(name, type)
    {
        this.name = name;
        this.type = type;
    }
}

function checkBadWord(word)
{
    let dIdx = badWordList.findIndex((element)=> element == word);
    if(dIdx == -1)
        return true;

    return false;
}

function initBadWord(){

}


function initData()
{
    let xhttp = new XMLHttpRequest();
    xhttp.open("GET", "getdata.php");

    xhttp.onreadystatechange = function(){
    	
	/*
	Property	Description
	onreadystatechange	Defines a function to be called when the readyState property changes
	readyState	Holds the status of the XMLHttpRequest.
	0: request not initialized
	1: server connection established
	2: request received
	3: processing request
	4: request finished and response is ready
	status	200: "OK"
	403: "Forbidden"
	404: "Page not found"
	For a complete list go to the Http Messages Reference
	statusText	Returns the status-text (e.g. "OK" or "Not Found")
	*/
    	
        if(xhttp.readyState == 4 && xhttp.status == 200){
            
            let data = JSON.parse(xhttp.responseText);
            for(let i=0; i < data.result.length; i++)
            {   
                wordlist.push(new Word(data.result[i].name, data.result[i].type));
            }
            
            wordlist.sort(function () {
	        return Math.random() - Math.random();
		    })
	
		    wordlist.sort(function () {
		        return Math.random() - Math.random();
		    })
        }
    }

	xhttp.send();
	
	initBadWord();
}

function addWord()
{

    /*
    let input = document.getElementById('awinput');

    let xhttp = new XMLHttpRequest();
    let str = `addword.php?aword=${input.value}`;
    xhttp.open("GET", str);
    
    xhttp.send();

    input.value = "";
    */

   let input = document.getElementById('awinput');
   
   let chkResult = checkBadWord(input.value);
   if(chkResult == false)
   {
	   if(confirm(`${input.value}(이)가 다른 사람들에게 추천할 단어입니까?`) == true)
		{
		    if(confirm(`${input.value}(이)가 온가족과 함께 게임할 수 있는 단어라고 생각하십니까?`) == true)
		    {
		        if(confirm(`다시 한 번 생각해도  ${input.value}(이)가 좋은 단어 같습니까?`) == true)
		        {
		            if(confirm(`${input.value}(이)가 너무 좋아서 항상 말하고 싶어지는 단어입니까?`) == true)
		            {
		                if(confirm(`${input.value}(을)를 등록하는 것에 정말 포기할 생각이 없으십니까?`) == true)
		                {
		                    alert(`제가 졌습니다! 하지만 ${input.value}(을)를 시스템에 등록하실 수 없습니다.`);
		                }
		            }
		        }
		    }       
		}
		input.placeholder = `${input.value} 등록 실패`;
		input.value = "";
   	return;
   }

   let xhttp = new XMLHttpRequest();
   let str = `addword.php?aword=${input.value}`;
   xhttp.open("GET", str, false);
   xhttp.send(null);

   if(xhttp.status !== 200) {
    throw new Error(xhttp.statusText);
    }

    if(xhttp.responseText == 11)
    {
        alert(`${input.value}(은)는 이미 있는 단어입니다.`);
        input.value = "";
    }
    if(xhttp.responseText == 22)
    {
        alert(`${input.value}(은)는 등록 대기 중입니다.`);
        input.value = "";
    }
    if(xhttp.responseText == 33)
        input.placeholder = `${input.value} 등록 성공`;
    if(xhttp.responseText == 44)
        input.placeholder = `${input.value} 등록 실패`;
    
   input.value = "";
}

function pickName()
{

    if(gCnt >= wordlist.lenth - 1)
    	gCnt = 0;
    	
    return wordlist[gCnt++].name;

    //console.log("random : ", wordlist.length);
}



function activeCounter()
{
	let xhttp = new XMLHttpRequest();
	xhttp.open("GET", "counter.php");
	xhttp.send();
}

function randomPick()
{
    let h1 = document.getElementById('picText');

    let name = pickName();
    gName = name;
    //name = name.replace(/[0-9]/g, '');

    h1.innerText = name;

    let hidebtn = document.getElementById('hidebtn');
    let menuDiv = document.getElementById('menuDiv');

    //console.log(menuDiv);

    if(hidebtn.innerText == "보이기")
    {
        hidebtn.innerText = "숨기기";
        menuDiv.style.visibility = "visible";
    }
}

function hide(){

    let hidebtn = document.getElementById('hidebtn');
    let menuDiv = document.getElementById('menuDiv');

    //console.log(menuDiv);

    if(hidebtn.innerText == "숨기기")
    {
        hidebtn.innerText = "보이기";
        menuDiv.style.visibility = "hidden";
    }
    else if(hidebtn.innerText == "보이기")
    {
        hidebtn.innerText = "숨기기";
        menuDiv.style.visibility = "visible";
    }
}

function deleteword()
{
	if(gName != null)
	{
		let xhttp = new XMLHttpRequest();
		
		//http://jungdolp.synology.me/word/deleteword.php?dword=%EA%B0%81%EC%A2%85
		let str = `deleteword.php?dword=${gName}`;
		xhttp.open("GET", str);
		xhttp.send();
		
		let h1 = document.getElementById('picText');
		h1.innerText = "삭제 완료";
				
		gName = null;
		randomPick();
	}
}

activeCounter();
initData();
