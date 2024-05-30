import React from 'react';
import { FaChartLine, FaDollarSign, FaClock } from 'react-icons/fa'; // Import icons
// Import component-specific CSS

const SiteHistoryOverview = () => {
  // Define static local values
  const numberOfVisits = 1000;
  const totalRevenue = "$5000";
  const averageSessionDuration = "00:05:30";

  return (
    <div className="container">
        
      <div className="site-history-container">
        <div className="row">
             <h2 className="Website-HistoryTitle">Website History</h2>
          <div className="col-md-4">
            <div className="site-history-card">
              <div className="summary-icon">
                <FaChartLine />
              </div>
              <div className="summary-details">
                <p>{numberOfVisits}</p>
                <h5>Number of Visits</h5>
              </div>
            </div>
          </div>
          <div className="col-md-4">
            <div className="site-history-card">
              <div className="summary-icon">
                <FaDollarSign />
              </div>
              <div className="summary-details">
                <p>{totalRevenue}</p>
                <h5>Total Revenue</h5>
              </div>
            </div>
          </div>
          <div className="col-md-4">
            <div className="site-history-card">
              <div className="summary-icon">
                <FaClock />
              </div>
              <div className="summary-details">
                <p>{averageSessionDuration}</p>
                <h5>Average Session Duration</h5>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  );
};

export default SiteHistoryOverview;
