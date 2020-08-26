package cn.jt.controller;


import cn.jt.entity.PageBean;
import cn.jt.entity.ReferCompound;
import cn.jt.entity.StandardSpectrum;
import cn.jt.service.ReferCompoundService;
import cn.jt.service.StandardSpectrumService;

import org.openscience.cdk.exception.CDKException;
import org.openscience.cdk.interfaces.IAtomContainer;
import org.openscience.cdk.layout.StructureDiagramGenerator;
import org.openscience.cdk.renderer.AtomContainerRenderer;
import org.openscience.cdk.renderer.RendererModel;
import org.openscience.cdk.renderer.font.AWTFontManager;
import org.openscience.cdk.renderer.generators.BasicAtomGenerator;
import org.openscience.cdk.renderer.generators.BasicBondGenerator;
import org.openscience.cdk.renderer.generators.BasicSceneGenerator;
import org.openscience.cdk.renderer.visitor.AWTDrawVisitor;
import org.openscience.cdk.silent.SilentChemObjectBuilder;
import org.openscience.cdk.smiles.SmilesParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.awt.image.RenderedImage;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;


@Controller
@RequestMapping("/browse")
public class BrowseController {
    @Autowired
    private ReferCompoundService referCompoundService;
    @Autowired
    private StandardSpectrumService standardSpectrumService;
    @Autowired
    private ReferCompound rc;
    @Autowired
    private StandardSpectrum ss;


    /*=======================referCompoundController===================================*/
    @RequestMapping("/referCompound")
    public ModelAndView referCompound(HttpServletRequest req) {
        //获取页码参数
        String currentPage = req.getParameter("currentPage");//当前页码
        String rows = req.getParameter("rows");//每页记录数
        if (currentPage == null || "".equals(currentPage)) {
            currentPage = "1";
        }
        if (rows == null || "".equals(rows)) {
            rows = "50";
        }
        //获取查询参数
        String name = req.getParameter("Name");
        String inchi = req.getParameter("Inchi");
        String formula = req.getParameter("Formula");
        //封装请求到referCompound中
        rc.setName(name);
        rc.setInchi(inchi);
        rc.setFormula(formula);
        //获取查询结果
        PageBean<ReferCompound> pb = referCompoundService.findReferCompoundAllByPage(Integer.parseInt(currentPage), Integer.parseInt(rows), rc);
        //数据存入域和页面跳转
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("rc", rc);
        modelAndView.addObject("pb", pb);
        modelAndView.setViewName("browseReferenceCompound");

        return modelAndView;
    }
    /*=======================referCompoundDetails===================================*/
    @RequestMapping("/referCompound/{ID}")
    public ModelAndView compoundDetail(@PathVariable String ID){
        ReferCompound cpd = referCompoundService.findReferCompoundById(ID);
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("cpd",cpd);
        modelAndView.setViewName("compoundDetails");
        return modelAndView;
    }

    @RequestMapping("/{ID}")
    public ModelAndView compoundImg(@PathVariable String ID, HttpServletResponse response){
        ReferCompound cpd = referCompoundService.findReferCompoundById(ID);
/*        try {
            String smiles = cpd.getSmiles();
            int WIDTH = 200;
            int HEIGHT = 250;
            Rectangle drawArea = new Rectangle(WIDTH, HEIGHT);
            Image image = new BufferedImage(WIDTH, HEIGHT, BufferedImage.TYPE_INT_RGB);
            SmilesParser smilesParser = new SmilesParser(SilentChemObjectBuilder.getInstance());
            IAtomContainer molecule = smilesParser.parseSmiles(smiles);
            StructureDiagramGenerator sdg = new StructureDiagramGenerator();
            sdg.setMolecule(molecule);
            sdg.generateCoordinates();
            molecule = sdg.getMolecule();
            ArrayList generators = new ArrayList();
            generators.add(new BasicSceneGenerator());
            generators.add(new BasicBondGenerator());
            generators.add(new BasicAtomGenerator());
            AtomContainerRenderer renderer =
                    new AtomContainerRenderer(
                            generators, new AWTFontManager()
                    );
            renderer.setup(molecule, drawArea);
            RendererModel model = renderer.getRenderer2DModel();
            model.set(BasicSceneGenerator.ZoomFactor.class, (double)0.9);
            Graphics2D g2 = (Graphics2D)image.getGraphics();
            g2.setColor(Color.WHITE);
            g2.fillRect(0, 0, WIDTH, HEIGHT);
            renderer.paint(molecule, new AWTDrawVisitor(g2));
            ImageIO.write(
                    (RenderedImage)image, "PNG",response.getOutputStream()
            );
        } catch (CDKException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }*/
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("cpd",cpd);
        modelAndView.setViewName("compoundDetailsImg");
        return modelAndView;
    }

    /*=======================standardSpectrumController===================================*/
    @RequestMapping("/standardSpectrum")
    public ModelAndView standardSpectrum(HttpServletRequest req) {
        //获取页码参数
        String currentPage = req.getParameter("currentPage");//当前页码
        String rows = req.getParameter("rows");//每页记录数
        if (currentPage == null || "".equals(currentPage)) {
            currentPage = "1";
        }
        if (rows == null || "".equals(rows)) {
            rows = "50";
        }
        //获取查询参数
        String name = req.getParameter("Name");
        String retentionTime = req.getParameter("RetentionTime");
        String precursorMZ = req.getParameter("PrecursorMZ");
        //封装到standardSpectrum中
        ss.setName(name);
        if (retentionTime == null || "".equals(retentionTime)) {
            ss.setRetentionTime(null);
        } else {
            ss.setRetentionTime(Double.parseDouble(retentionTime));
        }

        if (precursorMZ == null || "".equals(precursorMZ)) {
            ss.setPrecursorMZ(null);
        } else {
            ss.setPrecursorMZ(Double.parseDouble(precursorMZ));
        }
        //获取查询结果
        PageBean<StandardSpectrum> pb = standardSpectrumService.findStandardSpectrumAllByPage(Integer.parseInt(currentPage), Integer.parseInt(rows), ss);
        //数据存入域和页面跳转
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("ss", ss);
        modelAndView.addObject("pb", pb);
        modelAndView.setViewName("browseStandardSpectrum");

        return modelAndView;


    }
}
