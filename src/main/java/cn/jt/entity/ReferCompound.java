package cn.jt.entity;

import org.springframework.stereotype.Component;

@Component("referCompound")
public class ReferCompound {
    private String ID;
    private String Info;
    private String Smiles;
    private Float ExactMass;
    private String Inchi;
    private String Name;
    private String Formula;
    private String Classification;

    public ReferCompound() {
    }

    public ReferCompound(String ID, String info, String smiles, Float exactMass, String inchi, String name, String formula, String classification) {
        this.ID = ID;
        Info = info;
        Smiles = smiles;
        ExactMass = exactMass;
        Inchi = inchi;
        Name = name;
        Formula = formula;
        Classification = classification;
    }

    public String getID() {
        return ID;
    }

    public void setID(String ID) {
        this.ID = ID;
    }

    public String getInfo() {
        return Info;
    }

    public void setInfo(String info) {
        Info = info;
    }

    public String getSmiles() {
        return Smiles;
    }

    public void setSmiles(String smiles) {
        Smiles = smiles;
    }

    public Float getExactMass() {
        return ExactMass;
    }

    public void setExactMass(Float exactMass) {
        ExactMass = exactMass;
    }

    public String getInchi() {
        return Inchi;
    }

    public void setInchi(String inchi) {
        Inchi = inchi;
    }

    public String getName() {
        return Name;
    }

    public void setName(String name) {
        Name = name;
    }

    public String getFormula() {
        return Formula;
    }

    public void setFormula(String formula) {
        Formula = formula;
    }

    public String getClassification() {
        return Classification;
    }

    public void setClassification(String classification) {
        Classification = classification;
    }

    @Override
    public String toString() {
        return "ReferCompound{" +
                "ID='" + ID + '\'' +
                ", Info='" + Info + '\'' +
                ", Smiles='" + Smiles + '\'' +
                ", ExactMass=" + ExactMass +
                ", Inchi='" + Inchi + '\'' +
                ", Name='" + Name + '\'' +
                ", Formula='" + Formula + '\'' +
                ", Classification='" + Classification + '\'' +
                '}';
    }
}
