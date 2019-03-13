/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package expedition;

/**
 *
 * @author mac
 */
public class Expedition 

{
    private int numberOfNodes;
    private int numberOfVertices;
    private int numberOfRoutes;
    
    public Expedition(String[] nodes, String destination)
            
    {
        this.numberOfNodes = nodes.length;
        this.numberOfVertices = calculateVertexCount();
        this.numberOfRoutes = calculateRouteCount();
    }
    
    private int calculateVertexCount()
            
    {
        int count = 0;
        
        count = this.numberOfNodes * (this.numberOfNodes + 1) / 2;
        
        return count;
    }
    
    private int calculateRouteCount()
            
    {
        int factorial = this.numberOfNodes;
        
        for (int count = 1; count < this.numberOfNodes; count++)
            
        {
            factorial *= count;
        }
        
        return factorial;
    }
    
}
