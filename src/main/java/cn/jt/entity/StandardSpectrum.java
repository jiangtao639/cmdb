package cn.jt.entity;

import org.springframework.stereotype.Component;

@Component("standardSpectrum")
public class StandardSpectrum {
    private String FiehnHILICid;
    private String Name;
    private Double RetentionTime;
    private Double PrecursorMZ;
    private String PrecursorType;
    private String IonMode;
    private String CollisionEnergy;
    private String Instrument;
    private String InstrumentType;
    private String Library;

    public String getFiehnHILICid() {
        return FiehnHILICid;
    }

    public void setFiehnHILICid(String fiehnHILICid) {
        FiehnHILICid = fiehnHILICid;
    }

    public String getName() {
        return Name;
    }

    public void setName(String name) {
        Name = name;
    }

    public Double getRetentionTime() {
        return RetentionTime;
    }

    public void setRetentionTime(Double retentionTime) {
        RetentionTime = retentionTime;
    }

    public Double getPrecursorMZ() {
        return PrecursorMZ;
    }

    public void setPrecursorMZ(Double precursorMZ) {
        PrecursorMZ = precursorMZ;
    }

    public String getPrecursorType() {
        return PrecursorType;
    }

    public void setPrecursorType(String precursorType) {
        PrecursorType = precursorType;
    }

    public String getIonMode() {
        return IonMode;
    }

    public void setIonMode(String ionMode) {
        IonMode = ionMode;
    }

    public String getCollisionEnergy() {
        return CollisionEnergy;
    }

    public void setCollisionEnergy(String collisionEnergy) {
        CollisionEnergy = collisionEnergy;
    }

    public String getInstrument() {
        return Instrument;
    }

    public void setInstrument(String instrument) {
        Instrument = instrument;
    }

    public String getInstrumentType() {
        return InstrumentType;
    }

    public void setInstrumentType(String instrumentType) {
        InstrumentType = instrumentType;
    }

    public String getLibrary() {
        return Library;
    }

    public void setLibrary(String library) {
        Library = library;
    }

    @Override
    public String toString() {
        return "StandardSpectrum{" +
                "FiehnHILICid='" + FiehnHILICid + '\'' +
                ", Name='" + Name + '\'' +
                ", RetentionTime=" + RetentionTime +
                ", PrecursorMZ=" + PrecursorMZ +
                ", PrecursorType='" + PrecursorType + '\'' +
                ", IonMode='" + IonMode + '\'' +
                ", CollisionEnergy='" + CollisionEnergy + '\'' +
                ", Instrument='" + Instrument + '\'' +
                ", InstrumentType='" + InstrumentType + '\'' +
                ", Library='" + Library + '\'' +
                '}';
    }
}
