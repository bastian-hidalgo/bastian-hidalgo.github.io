const puppeteer = require('puppeteer');
const path = require('path');

(async () => {
    try {
        console.log('Iniciando exportación a PDF...');
        const browser = await puppeteer.launch();
        const page = await browser.newPage();
        
        // Cargar index.html desde el sistema de archivos
        const filePath = path.join(__dirname, 'index.html');
        await page.goto(`file://${filePath}`, { waitUntil: 'networkidle0' });

        // Generar PDF
        await page.pdf({
            path: 'Bastian-Hidalgo-CV.pdf',
            format: 'A4',
            printBackground: true,
            margin: {
                top: '0px',
                right: '0px',
                bottom: '0px',
                left: '0px'
            }
        });

        await browser.close();
        console.log('¡PDF generado con éxito: Bastian-Hidalgo-CV.pdf!');
    } catch (error) {
        console.error('Error generando el PDF:', error);
    }
})();
