
const fs=require('fs')
const { v4: uuidv4 } = require('uuid');
const path = require('path');
const mimeTypes = require('mime-types');


//funcion que permite obtener la fecha actual en formato 'yyyy-mm-dd'
function getCurrentDate() {
    const currentDate = new Date();
    
   
    const year = currentDate.getFullYear();
    const month = String(currentDate.getMonth() + 1).padStart(2, '0'); // Months are zero-based
    const day = String(currentDate.getDate()).padStart(2, '0');
    

    const formattedDate = `${year}-${month}-${day}`;
    
    return formattedDate;
  }


  //funcion que recibe un bae64 lo convierte a binario y o almacena en disco
/*
  async function saveFile64OnDisk(base64Data,fileName) {
  
  const base64String = base64Data.replace(/^data:[^;]+;base64,/, '');

  const buffer = Buffer.from(base64String, 'base64');

  const newFileName=uuidv4()+'_'+fileName
 
  const filePath = path.join(__dirname, '../uploads/personas',newFileName);

  fs.writeFileSync(filePath,buffer)
  return `/uploads/personas/`+newFileName
}
*/


async function saveFile64OnDisk(base64Data, fileName) {
  // Convert base64 string to buffer
  const base64String = base64Data.replace(/^data:[^;]+;base64,/, '');
  const buffer = Buffer.from(base64String, 'base64');

  // Validate file type using mime-types
  const detectedMimeType = mimeTypes.lookup(buffer);

  const fileExtension = path.extname(fileName).toLowerCase();
  if (!['.jpeg', '.png','.jpg'].includes(fileExtension)) {
    throw new Error('Invalid file type. Only JPEG , JPG and PNG files are allowed.');
  }

  // Generate unique filename
  const newFileName = uuidv4() + '_' + fileName;

  // Construct file path
  const filePath = path.join(__dirname, '../uploads/personas', newFileName);

  fs.writeFileSync(filePath,buffer)
  return `/uploads/personas/`+newFileName
}

  
  module.exports= {getCurrentDate,saveFile64OnDisk}