
const fs=require('fs')
const { v4: uuidv4 } = require('uuid');
const path = require('path');
function getCurrentDate() {
    const currentDate = new Date();
    
    // Get year, month, and day
    const year = currentDate.getFullYear();
    const month = String(currentDate.getMonth() + 1).padStart(2, '0'); // Months are zero-based
    const day = String(currentDate.getDate()).padStart(2, '0');
    
    // Form the 'YYYY-MM-DD' string
    const formattedDate = `${year}-${month}-${day}`;
    
    return formattedDate;
  }

async function saveFile64OnDisk(base64Data,fileName) {
  
  // Remove the data type prefix from the base64 string
  const base64String = base64Data.replace(/^data:[^;]+;base64,/, '');

  // Convert Base64 to binary buffer
  const buffer = Buffer.from(base64String, 'base64');

  const newFileName=uuidv4()+'_'+fileName
  // Create the path to save the file
  const filePath = path.join(__dirname, '../uploads/personas',newFileName);

  // Write the buffer to the file
  fs.writeFileSync(filePath,buffer)
  return `/uploads/personas/`+newFileName
}
  
  module.exports= {getCurrentDate,saveFile64OnDisk}