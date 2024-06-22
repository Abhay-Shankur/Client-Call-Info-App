import React from 'react';
import { FaChartLine, FaDollarSign, FaClock } from 'react-icons/fa'; // Import icons
// Import component-specific CSS

const SiteHistoryOverview = () => {
  // Define static local values
  const numberOfVisits = 1000;
  const totalRevenue = "$5000";
  const averageSessionDuration = "00:05:30";

  return (
    <div className="container my-5">

      <div className="site-history-container">
        <div className="row">
          <h2 className="Website-HistoryTitle">Website History</h2>
          <div className="col-md-4">
            {/* <div className="site-history-card">
              <div className="summary-icon">
                <FaChartLine />
              </div>
              <div className="summary-details">
                <p>{numberOfVisits}</p>
                <h5>Number of Visits</h5>
              </div>
            </div> */}

            <div className="card text-center m-auto" style={{ width: "18rem" }}>
              <div className="card-body">
                <h5 className="card-title"><FaChartLine /></h5>
                <p className="card-text">Number of Visits.</p>
                <span className="btn btn-primary">{numberOfVisits}</span>
              </div>
            </div>
          </div>

          <div className="col-md-4">
            {/* <div className="site-history-card">
              <div className="summary-icon">
                <FaDollarSign />
              </div>
              <div className="summary-details">
                <p>{totalRevenue}</p>
                <h5>Total Revenue</h5>
              </div>
            </div> */}

            <div className="card text-center m-auto" style={{ width: "18rem" }}>
              <div className="card-body">
                <h5 className="card-title"><FaDollarSign /></h5>
                <p className="card-text">Total Revenue.</p>
                <span className="btn btn-primary">{totalRevenue}</span>
              </div>
            </div>
          </div>
          <div className="col-md-4">
            {/* <div className="site-history-card">
              <div className="summary-icon">
                <FaClock />
              </div>
              <div className="summary-details">
                <p>{averageSessionDuration}</p>
                <h5>Average Session Duration</h5>
              </div>
            </div> */}

            <div className="card text-center m-auto" style={{ width: "18rem" }}>
              <div className="card-body">
                <h5 className="card-title"><FaClock /></h5>
                <p className="card-text">Average Session Duration.</p>
                <span className="btn btn-primary">{averageSessionDuration}</span>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  );
};

export default SiteHistoryOverview;
