/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.util.ArrayList;
import java.util.List;
/**
 *
 * @author Dwight Kenneth
 */
public class Storing {
    
    private ArrayList<String> Sresultlist = new ArrayList();
    private ArrayList<String> Aresultlist = new ArrayList();
    private ArrayList<ArrayList<String>> Lresultlist = new ArrayList();
    
    public void Ssetter (ArrayList<String> updatelist){
        Sresultlist = updatelist;
    }

    public List<String> Sgetter()
    {
        return Sresultlist;
    }    
    public void Asetter (ArrayList<String> updatelist){
        Aresultlist = updatelist;
    }

    public List<String> Agetter()
    {
        return Aresultlist;
    } 
    
    public void Lsetter (ArrayList<ArrayList<String>> updatelist){
        Lresultlist = updatelist;
    }

    public List<ArrayList<String>> Lgetter()
    {
        return Lresultlist;
    } 
}
