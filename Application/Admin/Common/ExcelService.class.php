<?php
/**
 * Created by PhpStorm.
 * User: MaiBenBen
 * Date: 2017/1/24
 * Time: 10:06
 */

namespace Admin\Common;



class ExcelService {
    //导出Excel
    public function __construct(){
        //导入PHPExcel类库，因为PHPExcel没有用命名空间，只能inport导入
        import("Org.Util.PHPExcel");
        import("Org.Util.PHPExcel.Writer.Excel5");
        import("Org.Util.PHPExcel.IOFactory.php");
    }
    public function excel($fileName,$tableheader,$data){
        //创建对象
        $excel = new \PHPExcel();
        //Excel表格式,这里简略写了8列
        $letter = array('A','B','C','D','E','F','F','G');
        /*
        //表头数组
        $tableheader = array('序号','客栈名称','客栈地址','座机','手机','QQ','邮箱');
        */
        //填充表头信息
        for($i = 0;$i < count($tableheader);$i++) {
            $excel->getActiveSheet()->setCellValue("$letter[$i]1","$tableheader[$i]");
        }
        /*
        //表格数组
        $data = array(
            array('1','丽江客栈','昆明市丽江','023-65987458','13598784587','1317615477','batista_bomb@163.com'),
            array('2','丽江客栈','昆明市丽江','023-65987458','13598784587','1317615477','batista_bomb@163.com'),
            array('3','丽江客栈','昆明市丽江','023-65987458','13598784587','1317615477','batista_bomb@163.com'),
            array('4','丽江客栈','昆明市丽江','023-65987458','13598784587','1317615477','batista_bomb@163.com'),
            array('5','丽江客栈','昆明市丽江','023-65987458','13598784587','1317615477','batista_bomb@163.com'),
            array('6','丽江客栈','昆明市丽江','023-65987458','13598784587','1317615477','batista_bomb@163.com'),
            array('7','丽江客栈','昆明市丽江','023-65987458','13598784587','1317615477','batista_bomb@163.com')
        );
        */
        //填充表格信息
        for ($i = 2;$i <= count($data) + 1;$i++) {
            $j = 0;
            foreach ($data[$i - 2] as $key=>$value) {
                $excel->getActiveSheet()->setCellValue("$letter[$j]$i","$value");
                $j++;
            }
        }
        //创建Excel输入对象
        $write = new \PHPExcel_Writer_Excel5($excel);
        header("Pragma: public");
        header("Expires: 0");
        header("Cache-Control:must-revalidate, post-check=0, pre-check=0");
        header("Content-Type:application/force-download");
        header("Content-Type:application/vnd.ms-execl");
        header("Content-Type:application/octet-stream");
        header("Content-Type:application/download");;
        header('Content-Disposition:attachment;filename="'.$fileName.'.xls"');
        header("Content-Transfer-Encoding:binary");

        $write->save('php://output');
    }
}